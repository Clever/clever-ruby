require 'rest_client'
require 'multi_json'

require 'clever/util'
require 'clever/json'

module Clever
  @@api_key = nil
  @@api_base = 'https://api.getclever.com/v1.1/'

  def self.api_url(url='')
    @@api_base + url
  end

  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end
end