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

    # Initialize configuration
    # @api private
    # @return [Clever::Configuration]
    def initialize
      @api_key  = nil
      @token = nil
      @api_base = 'https://api.clever.com/'
    end
  end
end
