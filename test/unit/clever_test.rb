require 'test_helper'

class CleverTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = "DEMO_KEY"
    end
  end

  should "return top-level resource urls" do
    assert_equal("https://api.getclever.com/v1.1/districts", Clever.resource_url("districts"))
    assert_equal("https://api.getclever.com/v1.1/schools", Clever.resource_url("schools"))
    assert_equal("https://api.getclever.com/v1.1/students", Clever.resource_url("students"))
    assert_equal("https://api.getclever.com/v1.1/sections", Clever.resource_url("sections"))
    assert_equal("https://api.getclever.com/v1.1/teachers", Clever.resource_url("teachers"))
  end
end
