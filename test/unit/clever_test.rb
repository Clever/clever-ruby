require 'test_helper'

class CleverTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = "DEMO_KEY"
    end
  end

  should "return api urls" do
    assert_equal("https://api.getclever.com/v1.1/districts", Clever.api_url("districts"))
    assert_equal("https://api.getclever.com/v1.1/schools", Clever.api_url("schools"))
    assert_equal("https://api.getclever.com/v1.1/students", Clever.api_url("students"))
    assert_equal("https://api.getclever.com/v1.1/sections", Clever.api_url("sections"))
    assert_equal("https://api.getclever.com/v1.1/teachers", Clever.api_url("teachers"))
  end
end
