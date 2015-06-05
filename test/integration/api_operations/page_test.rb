require 'test_helper'

# Test api_operations/Page
describe Clever::APIOperations::Page, :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  it "populates metadata from response" do
    page = Clever::APIOperations::Page.new 'v1.1/districts'
    assert_instance_of Hash, page.metadata
    assert_equal page.metadata[:total], 2600
  end

end
