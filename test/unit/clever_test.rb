require 'test_helper'

class CleverTest < Test::Unit::TestCase
  should "set the api key" do
    Clever.api_key = "DEMO_KEY"
    assert_equal("DEMO_KEY", Clever.api_key)
  end

  should "return api urls" do
    assert_equal("https://api.getclever.com/v1.1/districts", Clever.api_url("districts"))
    assert_equal("https://api.getclever.com/v1.1/schools", Clever.api_url("schools"))
    assert_equal("https://api.getclever.com/v1.1/students", Clever.api_url("students"))
    assert_equal("https://api.getclever.com/v1.1/sections", Clever.api_url("sections"))
    assert_equal("https://api.getclever.com/v1.1/teachers", Clever.api_url("teachers"))
  end
end
