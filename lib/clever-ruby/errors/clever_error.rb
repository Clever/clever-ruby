module Clever
  # Represents an error outputted by the Clever API
  class CleverError < StandardError
    # Access error Message
    # @api public
    # @return [String]
    # @example
    #   puts err.message
    attr_reader :message

    # Access HTTP status of error
    # @api public
    # @return [Integer]
    # @example
    #   puts err.http_status
    attr_reader :http_status

    # Access HTTP body of error
    # @api public
    # @return [String]
    # @example
    #   puts err.http_body
    attr_reader :http_body

    # Access JSON body of error
    # @api public
    # @return [String]
    # @example
    #   puts err.json_body
    attr_reader :json_body

    # Create CleverError instance
    # @api private
    # @return [Clever::CleverError]
    def initialize(message = nil, http_status = nil, http_body = nil, json_body = nil)
      @message = message
      @http_status = http_status
      @http_body = http_body
      @json_body = json_body
    end

    # Output CleverError instance as a human-readable string
    # @api public
    # @return [String]
    # @example
    #   puts err.to_s
    def to_s
      status_string = @http_status.nil? ? '' : "(Status #{@http_status}) "
      "#{status_string}#{@message}"
    end
  end
end
