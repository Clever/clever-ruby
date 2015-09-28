module Clever
  # Configuration for accessing the Clever API over HTTP
  class Configuration
    # Access API Key
    # @api private
    # @return [String]
    attr_accessor :api_key

    # Access API Token
    # @api private
    # @return [String]
    attr_accessor :token

    # Access API base URL
    # @api private
    # @return [String]
    attr_accessor :api_base

    # Access API timeout
    # @api private
    # @return [Fixnum]
    attr_accessor :timeout

    # Access API open timeout
    # @api private
    # @return [Fixnum]
    attr_accessor :open_timeout

    # Initialize configuration
    # @api private
    # @return [Clever::Configuration]
    def initialize
      @api_key  = nil
      @token = nil
      @api_base = 'https://api.clever.com/'
      @timeout = 120
      @open_timeout = 30
    end
  end
end
