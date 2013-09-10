require 'rest_client'
require 'multi_json'
require 'open-uri'

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

module Clever
  class << self
    def configure
      yield configuration
    end

    def api_key
      configuration.api_key
    end

    def configuration
      @configuration ||= Clever::Configuration.new
    end

    def resource_url(resource_name = '')
      configuration.api_base + 'v1.1/' + resource_name
    end

    def api_url(url = '')
      configuration.api_base + url
    end
  end

  def self.convert_to_query_string(params = nil)
    if params && params.count
      "?" + Util.flatten_params(params).collect { |p|
        "#{URI::encode(p[0].to_s)}=#{URI::encode(p[1].to_s)}"
      }.join('&')
    else
      ''
    end
  end

  def self.request(method, url, params=nil, headers={})
    raise AuthenticationError.new('No API key provided. (HINT: set your API key using "Clever.configure { |config| config.api_key = <API-KEY> }")') unless Clever.api_key

    params = Util.objects_to_ids(params)
    url = self.api_url(url)

    case method.to_s.downcase.to_sym
    when :get, :head, :delete
      url += convert_to_query_string(params)
      payload = nil
    else
      payload = params
    end

    opts = {
      :user => Clever.api_key,
      :password => "",
      :method => method,
      :url => url,
      :headers => headers,
      :open_timeout => 30,
      :payload => payload,
      :timeout => 80
    }

    begin
      response = execute_request(opts)
    rescue SocketError => e
      self.handle_restclient_error(e)
    rescue NoMethodError => e
      # Work around RestClient bug
      if e.message =~ /\WRequestFailed\W/
        e = APIConnectionError.new('Unexpected HTTP response code')
        self.handle_restclient_error(e)
      else
        raise
      end
    rescue RestClient::ExceptionWithResponse => e
      if rcode = e.http_code and rbody = e.http_body
        self.handle_api_error(rcode, rbody)
      else
        self.handle_restclient_error(e)
      end
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
      self.handle_restclient_error(e)
    end

    rbody = response.body
    rcode = response.code
    begin
      # Would use :symbolize_names => true, but apparently there is
      # some library out there that makes symbolize_names not work.
      resp = Clever::JSON.load(rbody)
    rescue MultiJson::DecodeError
      raise APIError.new("Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})", rcode, rbody)
    end

    resp = Util.symbolize_names(resp)
    resp
  end

  private

  def self.execute_request(opts)
    RestClient::Request.execute(opts)
  end

  def self.handle_restclient_error(e)
    case e
    when RestClient::ServerBrokeConnection, RestClient::RequestTimeout
      message = "Could not connect to Clever (#{configuration.api_base}). Please check your internet connection and try again."
    when SocketError
      message = "Unexpected error communicating when trying to connect to Clever. HINT: You may be seeing this message because your DNS is not working. To check, try running 'host getclever.com' from the command line."
    else
      message = "Unexpected error communicating with Clever."
    end
    message += "\n\n(Network error: #{e.message})"
    raise APIConnectionError.new(message)
  end

  def self.handle_api_error(rcode, rbody)
    begin
      error_obj = Clever::JSON.load(rbody)
      error_obj = Util.symbolize_names(error_obj)
      error = error_obj[:error] or raise StripeError.new # escape from parsing
    rescue MultiJson::DecodeError, StripeError
      raise APIError.new("Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})", rcode, rbody)
    end

    case rcode
    when 400, 404 then
      raise invalid_request_error(error, rcode, rbody, error_obj)
    when 401
      raise authentication_error(error, rcode, rbody, error_obj)
    else
      raise api_error(error, rcode, rbody, error_obj)
    end
  end

  def self.invalid_request_error(error, rcode, rbody, error_obj)
    if error.is_a? Hash
      InvalidRequestError.new(error[:message], error[:param], rcode, rbody, error_obj)
    else
      InvalidRequestError.new(error, '', rcode, rbody, error_obj)
    end
  end

  def self.authentication_error(error, rcode, rbody, error_obj)
    AuthenticationError.new(error[:message], rcode, rbody, error_obj)
  end

  def self.api_error(error, rcode, rbody, error_obj)
    APIError.new(error[:message], rcode, rbody, error_obj)
  end
end
