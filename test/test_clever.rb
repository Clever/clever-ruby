require 'helper'
require 'clever'

class TestClever < Test::Unit::TestCase
  should "set the api key" do
    Clever.api_key = "DEMO_KEY"
    assert_equal("DEMO_KEY", Clever.api_key)
  end

  should "return an api url" do
    assert_equal("https://api.getclever.com/v1.1/students", Clever.api_url("students"))
  end

end
