# rubocop:disable FileName
require 'rest_client'
require 'multi_json'
require 'open-uri'
require 'set'

require 'clever-ruby/version'

# API operations
require 'clever-ruby/api_operations/list'
require 'clever-ruby/api_operations/pagelist'
require 'clever-ruby/api_operations/page'

# Helpers
require 'clever-ruby/util'
require 'clever-ruby/json'
require 'clever-ruby/configuration'

# Resources
require 'clever-ruby/clever_object'
require 'clever-ruby/api_resource'
require 'clever-ruby/district'
require 'clever-ruby/school'
require 'clever-ruby/student'
require 'clever-ruby/section'
require 'clever-ruby/teacher'
require 'clever-ruby/event'

# Errors
require 'clever-ruby/errors/clever_error'

require 'clever-ruby/errors/api_connection_error'
require 'clever-ruby/errors/api_error'
require 'clever-ruby/errors/authentication_error'
require 'clever-ruby/errors/invalid_request_error'

# Clever Ruby library
module Clever
  class << self
    def configure
      yield configuration
    end

    def api_key
      configuration.api_key
    end

    def token
      configuration.token
    end

    def configuration
      @configuration ||= Clever::Configuration.new
    end

    def api_url(url = '')
      configuration.api_base + url
    end
  end

  def self.convert_to_query_string(params = nil)
    if params && params.count
      params_arr = Util.flatten_params(params).map do |p|
        "#{URI.encode(p[0].to_s)}=#{URI.encode(p[1].to_s)}"
      end
      '?' + params_arr.join('&')
    else
      ''
    end
  end

  def self.create_payload(method, url, params)
    case method.to_s.downcase.to_sym
    when :get, :head, :delete
      url += convert_to_query_string params
      payload = nil
    else
      payload = params
    end
    [url, payload]
  end

  def self.create_request_opts(method, url, params, headers)
    params = Util.objects_to_ids params
    url = api_url url
    url, payload = create_payload method, url, params

    headers[:Authorization] = 'Bearer ' + Clever.token if Clever.token

    opts = {
      method: method,
      url: url,
      headers: headers,
      open_timeout: 30,
      payload: payload,
      timeout: 120
    }
    if Clever.api_key
      opts[:user] = Clever.api_key
      opts[:password] = ''
    end
    opts
  end

  def self.check_authorization
    unless Clever.api_key || Clever.token
      fail AuthenticationError, 'No API key provided. (HINT: set your API key using '\
        '"Clever.configure { |config| config.api_key = <API-KEY> }" or your token using '\
        '"Clever.configure { |config| config.token = <TOKEN> }")'
    end
  end

  def self.request(method, url, params = nil, headers = {})
    check_authorization
    opts = create_request_opts method, url, params, headers
    response = execute_request opts

    rbody = response.body
    rcode = response.code
    begin
      resp = Clever::JSON.load rbody
    rescue MultiJson::DecodeError
      raise APIError.new(
        "Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})",
        rcode, rbody)
    end

    resp
  end

  private

  def self.execute_request(opts)
    begin
      request = RestClient::Request.execute opts
    rescue SocketError => e
      handle_restclient_error e
    rescue NoMethodError => e
      # TODO: investigate
      # Work around RestClient bug
      if e.message =~ /\WRequestFailed\W/
        handle_restclient_error APIConnectionError.new 'Unexpected HTTP response code'
      else raise
      end
    rescue RestClient::ExceptionWithResponse => e
      rcode = e.http_code
      rbody = e.http_body
      if rcode && rbody
        handle_api_error rcode, rbody
      else handle_restclient_error e
      end
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
      handle_restclient_error e
    end

    request
  end

  def self.handle_restclient_error(e)
    case e
    when RestClient::ServerBrokeConnection, RestClient::RequestTimeout
      message = "Could not connect to Clever (#{configuration.api_base}). " \
      'Please check your internet connection and try again.'
    when SocketError
      message = 'Unexpected error communicating when trying to connect to Clever. HINT: ' \
        'You may be seeing this message because your DNS is not working. To check, try running ' \
        "'host api.clever.com' from the command line."
    else
      message = 'Unexpected error communicating with Clever.'
    end
    message += "\n\n(Network error: #{e.message})"
    fail APIConnectionError, message
  end

  def self.handle_api_error(rcode, rbody)
    begin
      error_obj = Clever::JSON.load rbody
      error = error_obj[:error]
      fail CleverError unless error # escape from parsing
    rescue MultiJson::DecodeError, CleverError
      raise APIError.new(
        "Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})",
        rcode, rbody)
    end

    case rcode
    when 400, 404 then
      fail invalid_request_error error, rcode, rbody, error_obj
    when 401
      fail authentication_error error, rcode, rbody, error_obj
    else
      fail api_error error, rcode, rbody, error_obj
    end
  end

  def self.invalid_request_error(error, rcode, rbody, error_obj)
    if error.is_a? Hash
      InvalidRequestError.new error[:message], error[:param], rcode, rbody, error_obj
    else
      InvalidRequestError.new error, '', rcode, rbody, error_obj
    end
  end

  def self.authentication_error(error, rcode, rbody, error_obj)
    AuthenticationError.new error[:message], rcode, rbody, error_obj
  end

  def self.api_error(error, rcode, rbody, error_obj)
    APIError.new error[:message], rcode, rbody, error_obj
  end
end
