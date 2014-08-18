require 'test_helper'

class OptionalAttributesTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.token = "DEMO_TOKEN"
    end

    VCR.use_cassette("schools_optional_attributes") do
      @schools = Clever::School.all
    end
  end

  # Deferring this test because the demo data no longer contains a school that
  # does not have a state ID.
  should_eventually "return nil for an optional attribute that isnt present" do
    clever_academy = @schools.detect{ |s| s.id == "4fee004cca2e43cf27000001"}

    # Must not raise a NoMethodError.
    clever_academy.state_id.must_equal nil
  end

  should "have the expected value for an optional attribute that is present" do
    clever_prep = @schools.detect{ |s| s.id == "530e595026403103360ff9ff"}
    clever_prep.state_id.must_equal "412"
  end

  should "raise a NoMethodError for an invalid attribute" do
    clever_academy = @schools.detect{ |s| s.id == "530e595026403103360ff9ff"}

    lambda {
      clever_academy.some_attribute_that_doesnt_exist
    }.must_raise NoMethodError
  end
end
