module Clever
  class InvalidRequestError < CleverError
    attr_accessor :param

    def initialize(message, param, http_status=nil, http_body=nil, json_body=nil, opts={})
      super(message, http_status, http_body, json_body, opts)
      @param = param
    end
  end
end