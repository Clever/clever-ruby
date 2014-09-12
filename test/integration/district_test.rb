require 'test_helper'

# helpers for district tests
module DistrictHelpers
  def test_object_list(plural_object_name, object_count, instance_name)
    VCR.use_cassette("districts_#{plural_object_name}", allow_playback_repeats: true) do
      district = Clever::District.all.first
      district.send(plural_object_name).size.must_equal object_count
      district.send(plural_object_name).first.must_be_instance_of instance_name
    end
  end

  def test_object_pages(object_name, limit, page_count)
    VCR.use_cassette("districts_#{object_name}_pages", allow_playback_repeats: true) do
      district = Clever::District.all.first
      object_count_from_list = district.send("#{object_name}s", limit: 100_000).size

      object_count_from_paging = 0
      pages = 0
      district.send("#{object_name}_pages", limit: limit).each do |object_page|
        pages += 1
        objects = object_page.all
        object_count_from_paging += objects.size
      end

      object_count_from_paging.must_equal object_count_from_list
      pages.must_equal page_count
    end
  end
end

describe Clever::District do
  include DistrictHelpers

  before do
    Clever.configure do |config|
      config.api_key = 'DEMO_KEY'
    end
  end

  def test_retrieval
    it "retrieves a district's schools" do
      test_object_list 'schools', 3, Clever::School
    end

    it "retrieves a district's teachers" do
      test_object_list 'teachers', 89, Clever::Teacher
    end

    it "retrieves a district's sections" do
      test_object_list 'sections', 100, Clever::Section
    end

    it "retrieves a district's students" do
      test_object_list 'students', 100, Clever::Student
    end

    it "retrieves a district's events" do
      test_object_list 'events', 13, Clever::Event
    end
  end

  def test_filtered_retrieval
    it "retrieves a district's students with a small filter" do
      VCR.use_cassette('districts_students_filtered') do
        @district = Clever::District.all.first
        @district.students(limit: 2).size.must_equal 2
      end
    end
  end

  def test_pages
    it "pages a district's schools" do
      test_object_pages 'school', 2, 2
    end

    it "pages a district's teachers" do
      test_object_pages 'teacher', 10, 9
    end

    it "pages a district's sections" do
      test_object_pages 'section', 10, 38
    end

    it "pages a district's students" do
      test_object_pages 'student', 50, 21
    end

    it "pages a district's events" do
      test_object_pages 'event', 1, 14
    end
  end
end
