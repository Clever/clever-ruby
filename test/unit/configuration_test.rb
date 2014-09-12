require 'test_helper'

# test api configuraton
describe Clever::Configuration do
  it 'raises an error if no api key is set' do
    Clever.configure do |config|
      config.api_key = nil
      config.token = nil
    end

    -> { Clever.request(:get, 'a') }.must_raise Clever::AuthenticationError
  end

  it 'sets the api key' do
    Clever.configure do |config|
      config.api_key = 'DEMO_KEY'
    end
    assert_equal 'DEMO_KEY', Clever.api_key
  end

  it 'sets the api token' do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
    assert_equal 'DEMO_TOKEN', Clever.token
  end

  it 'sets a default for the api base' do
    Clever.configuration.api_base.must_equal 'https://api.clever.com/'
  end
end
