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

  should "page a district's schools" do
    VCR.use_cassette("districts_school_pages", :allow_playback_repeats => true) do
      @district = Clever::District.all.first
      schools_from_list = @district.schools({limit: 100000}).size
      limit = 2

      schools_from_paging = 0
      pages = 0
      @district.school_pages({ limit: limit }).each do |school_page|
        pages += 1
        schools = school_page.all
        schools_from_paging += schools.size
      end

      schools_from_paging.must_equal schools_from_list
      pages.must_equal 2
    end
  end

  should "retrieve a district's teachers" do
    VCR.use_cassette("districts_teachers") do
      @district = Clever::District.all.first
      @district.teachers.size.must_equal 48
    end
  end

  should "page a district's teachers" do
    VCR.use_cassette("districts_teacher_pages", :allow_playback_repeats => true) do
      @district = Clever::District.all.first
      teachers_from_list = @district.teachers({limit: 100000}).size
      limit = 10

      teachers_from_paging = 0
      pages = 0
      @district.teacher_pages({ limit: limit }).each do |teacher_page|
        pages += 1
        teachers = teacher_page.all
        teachers_from_paging += teachers.size
      end

      teachers_from_paging.must_equal teachers_from_list
      pages.must_equal 5
    end
  end

  should "retrieve a district's sections" do
    VCR.use_cassette("districts_sections") do
      @district = Clever::District.all.first
      @district.sections.size.must_equal 44
    end
  end

  should "page a district's sections" do
    VCR.use_cassette("districts_section_pages", :allow_playback_repeats => true) do
      @district = Clever::District.all.first
      sections_from_list = @district.sections({limit: 100000}).size
      limit = 10

      sections_from_paging = 0
      pages = 0
      @district.section_pages({ limit: limit }).each do |section_page|
        pages += 1
        sections = section_page.all
        sections_from_paging += sections.size
      end

      sections_from_paging.must_equal sections_from_list
      pages.must_equal 5
    end
  end

  should "retrieve a district's students" do
    VCR.use_cassette("districts_students") do
      @district = Clever::District.all.first
      @district.students.size.must_equal 100
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

  should "page a district's events" do
    VCR.use_cassette("districts_event_pages", :allow_playback_repeats => true) do
      @district = Clever::District.all.first
      events_from_list = @district.events({limit: 100000}).size
      limit = 1

      events_from_paging = 0
      pages = 0
      @district.event_pages({ limit: limit }).each do |event_page|
        pages += 1
        events = event_page.all
        events_from_paging += events.size
      end

      events_from_paging.must_equal events_from_list
      pages.must_equal 1
    end
  end
end
