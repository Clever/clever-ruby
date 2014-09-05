require 'test_helper'

# test api configuraton
class CleverConfigurationTest < Test::Unit::TestCase
  should 'set the api key' do
    Clever.configure do |config|
      config.api_key = 'DEMO_KEY'
    end
    assert_equal 'DEMO_KEY', Clever.api_key
  end

  should 'raise an error if no api key is set' do
    -> { Clever.request(stub, stub) }.must_raise Clever::AuthenticationError
  end

  should 'set a default for the api base' do
    Clever.configuration.api_base.must_equal 'https://api.clever.com/'
  end
end
