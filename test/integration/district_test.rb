require 'test_helper'

class ListTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = "DEMO_KEY"
    end
  end

  should "retrieve a district's schools" do
    VCR.use_cassette("districts_schools") do
      @district = Clever::District.all.first
      @district.schools.size.must_equal 4
    end
  end
end
