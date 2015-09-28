require 'test_helper'

module Minitest
  # Add assertions to Minitest
  module Assertions
    def assert_valid_object_list(plural_object_name, object_count, instance_name)
      district = Clever::District.retrieve('4fd43cc56d11340000000005', 'DEMO_TOKEN')
      district.send(plural_object_name).size.must_equal object_count
      district.send(plural_object_name).first.must_be_instance_of instance_name
    end

    def assert_valid_object_pages(object_name, limit, page_count)
      district = Clever::District.retrieve('4fd43cc56d11340000000005', 'DEMO_TOKEN')
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

describe 'Clever::District without global token', :vcr do
  before do
    Clever.configure do |config|
      config.token = nil
    end
  end

  it "retrieves a district's schools" do
    assert_valid_object_list 'schools', 3, Clever::School
  end

  it "retrieves a district's teachers" do
    assert_valid_object_list 'teachers', 89, Clever::Teacher
  end

  it "retrieves a district's sections" do
    VCR.use_cassette('Clever_District_without_global_token/retrieves_a_district_s_sections',
                     allow_playback_repeats: true) do
      assert_valid_object_list 'sections', 379, Clever::Section
    end
  end

  it "retrieves a district's students" do
    VCR.use_cassette('Clever_District_without_global_token/retrieves_a_district_s_students',
                     allow_playback_repeats: true) do
      assert_valid_object_list 'students', 1004, Clever::Student
    end
  end

  it "retrieves a district's district admins" do
    VCR.use_cassette('Clever_District_without_global_token/retrieves_a_district_s_district_admins',
                     allow_playback_repeats: true) do
      assert_valid_object_list 'district_admins', 1, Clever::DistrictAdmin
    end
  end

  it "retrieves a district's school admins" do
    VCR.use_cassette('Clever_District_without_global_token/retrieves_a_district_s_school_admins',
                     allow_playback_repeats: true) do
      assert_valid_object_list 'school_admins', 1, Clever::SchoolAdmin
    end
  end

  # TODO: this is outdated and should be removed!
  describe 'pages methods' do
    it "pages a district's schools" do
      assert_valid_object_pages 'school', 2, 2
    end

    it "pages a district's teachers" do
      assert_valid_object_pages 'teacher', 10, 9
    end

    it "pages a district's sections" do
      assert_valid_object_pages 'section', 10, 38
    end

    it "pages a district's students" do
      assert_valid_object_pages 'student', 50, 21
    end

    it "pages a district's events" do
      assert_valid_object_pages 'event', 2, 1
    end
  end
end
