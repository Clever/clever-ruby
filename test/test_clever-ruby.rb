require 'helper'
require 'clever-ruby'

class TestClever < Test::Unit::TestCase
  should "set the api key" do
    Clever.api_key = "DEMO_KEY"
    assert_equal("DEMO_KEY", Clever.api_key)
  end
end
