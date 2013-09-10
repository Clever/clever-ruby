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
    VCR.use_cassette("districts_events", :allow_playback_repeats => true) do
      @district = Clever::District.all.first
      @district.events.size.must_equal 1
      event = @district.events.first
      event.must_be_instance_of Clever::Event
    end
  end

  should "page a district's students" do
    VCR.use_cassette("districts_student_pages", :allow_playback_repeats => true) do
      @district = Clever::District.all.first
      students_from_list = @district.students({limit: 100000}).size
      limit = 50

      students_from_paging = 0
      pages = 0
      @district.student_pages({ limit: limit }).each do |student_page|
        pages += 1
        students = student_page.all
        students_from_paging += students.size
      end

      students_from_paging.must_equal students_from_list
      pages.must_equal 18
    end
  end
end
