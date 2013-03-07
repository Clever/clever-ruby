module Clever
  class Configuration
    attr_accessor :api_key, :api_base

    def initialize
      @api_key  = nil
      @api_base = 'https://api.getclever.com/'
    end
  end
end