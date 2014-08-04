require 'test_helper'

class CleverConfigurationTest < Test::Unit::TestCase

  should "set the token" do
    Clever.configure do |config|
      config.token = "DEMO_TOKEN"
    end
    assert_equal("DEMO_TOKEN", Clever.token)
  end

  should "raise an error if no api key is set" do
    lambda {
      Clever.request(stub, stub)
    }.must_raise Clever::AuthenticationError
  end

  should "set a default for the api base" do
    Clever.configuration.api_base.must_equal('https://api.clever.com/')
  end

end
