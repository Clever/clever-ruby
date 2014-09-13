require 'test_helper'

module Minitest
  # Add assertions to Minitest
  module Assertions
    def assert_valid_object_pages(object_name, limit, page_count)
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

describe Clever::District, :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
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
      assert_valid_object_pages 'event', 1, 8
    end
  end
end
