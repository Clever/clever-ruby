module Clever
  class Configuration
    attr_accessor :api_key, :token, :api_base, :timeout, :open_timeout

    def initialize
      @api_key  = nil
      @token = nil
      @api_base = 'https://api.clever.com/'
      @timeout = 80
      @open_timeout = 30
    end
  end
end