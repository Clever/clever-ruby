require 'helper'
require 'clever-ruby'

class TestCleverRuby < Test::Unit::TestCase
  should "set the api key" do
    CleverRuby.api_key = "DEMO_KEY"
    assert_equal("DEMO_KEY", CleverRuby.api_key)
  end
end
