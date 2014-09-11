module Clever
  # An invalid request to the Clever API
  class InvalidRequestError < CleverError
    # Access param
    # @api private
    # @return [Object]
    attr_accessor :param

    # Create new InvalidRequestError
    # @api private
    # @return [Clever::InvalidRequestError]
    def initialize(message, param, http_status = nil, http_body = nil, json_body = nil)
      super message, http_status, http_body, json_body
      @param = param
    end
  end
end
