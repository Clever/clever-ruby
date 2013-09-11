require 'test_helper'

class ListTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = "DEMO_KEY"
    end
  end

  should "retrieve a district's schools" do
    test_object_list 'schools', 4, Clever::School
  end

  should "page a district's schools" do
    test_object_pages('school', 2, 2)
  end

  should "retrieve a district's teachers" do
    test_object_list 'teachers', 48, Clever::Teacher
  end

  should "page a district's teachers" do
    test_object_pages('teacher', 10, 5)
  end

  should "retrieve a district's sections" do
    test_object_list 'sections', 44, Clever::Section
  end

  should "page a district's sections" do
    test_object_pages('section', 10, 5)
  end

  should "retrieve a district's students" do
    test_object_list 'students', 100, Clever::Student
  end

  should "page a district's students" do
    test_object_pages('student', 50, 18)
  end

  should "retrieve a district's students with a small filter" do
    VCR.use_cassette("districts_students_filtered") do
      @district = Clever::District.all.first
      @district.students({limit: 2}).size.must_equal 2
    end
  end

  should "retrieve a district's events" do
    test_object_list 'events', 1, Clever::Event
  end

  should "page a district's events" do
    test_object_pages('event', 1, 1)
  end

  private

  def test_object_list(plural_object_name, object_count, instance_name)
    VCR.use_cassette("districts_#{plural_object_name}", :allow_playback_repeats => true) do
      district = Clever::District.all.first
      district.send(plural_object_name).size.must_equal object_count
      district.send(plural_object_name).first.must_be_instance_of instance_name
    end
  end

  def test_object_pages(object_name, limit, page_count)
    VCR.use_cassette("districts_#{object_name}_pages", :allow_playback_repeats => true) do
      district = Clever::District.all.first
      object_count_from_list = district.send("#{object_name}s", {limit: 100000}).size

      object_count_from_paging = 0
      pages = 0
      district.send("#{object_name}_pages", { limit: limit }).each do |object_page|
        pages += 1
        objects = object_page.all
        object_count_from_paging += objects.size
      end

      object_count_from_paging.must_equal object_count_from_list
      pages.must_equal page_count
    end
  end
end
