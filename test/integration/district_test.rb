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

  should "retrieve a district's teachers" do
    VCR.use_cassette("districts_teachers") do
      @district = Clever::District.all.first
      @district.teachers.size.must_equal 48
    end
  end

  should "retrieve a district's sections" do
    VCR.use_cassette("districts_sections") do
      @district = Clever::District.all.first
      @district.sections.size.must_equal 44
    end
  end

  should "retrieve a district's students" do
    VCR.use_cassette("districts_students") do
      @district = Clever::District.all.first
      @district.students.size.must_equal 100
    end
  end

  should "retrieve a district's students with a small filter" do
    VCR.use_cassette("districts_students_filtered") do
      @district = Clever::District.all.first
      @district.students({limit: 2}).size.must_equal 2
    end
  end

  should "retrieve a district's events" do
    VCR.use_cassette("districts_events") do
      @district = Clever::District.all.first
      @district.events.size.must_equal 1
      event = @district.events.first
      event.must_be_instance_of Clever::Event
    end
  end
end
