require 'test_helper'

# Test api_operations/List
class ListTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = 'DEMO_KEY'
    end
  end

  def assert_type(resource, elem)
    assert_instance_of resource, elem, "All elems of #{resource.url} should be of "\
      "type #{resource.name}, instead got #{elem.class.name}. elem: #{elem.inspect}"
  end

  def self.resource_name(resource)
    resource.name.split('::')[-1].downcase
  end

  [[Clever::District, 1], [Clever::School, 3], [Clever::Teacher, 89],
   [Clever::Student, 1004], [Clever::Section, 379], [Clever::Event, 13]].each do |test_data|
    resource, expected = test_data
    name = resource_name resource

    should "count #{name} properly" do
      VCR.use_cassette "#{name}_count" do
        count = resource.count
        assert count.is_a?(Integer), "count should return an Integer. count: #{count}"
        assert_equal expected, count, "Expected #{expected} #{name}s to exist, "\
          "but only #{count} were found. Perhaps the test data has changed?"
      end
    end
  end

  [Clever::District, Clever::School, Clever::Teacher,
   Clever::Student, Clever::Section, Clever::Event].each do |resource|
    name = resource_name resource

    should "reject invalid id for #{resource}.find one" do
      id = 'invalid_id'
      assert_raises ArgumentError do
        resource.find(id)
      end
    end

    should "reject invalid ids for #{resource}.find multiple" do
      # one valid, one invalid
      ids = %w(123412341234123412341234 invalid_id)
      assert_raises ArgumentError do
        resource.find(ids)
      end
    end

    should "find #{name}s by page" do
      VCR.use_cassette "#{name}_find_by_page" do
        result = resource.find
        assert_instance_of Clever::APIOperations::ResultsList, result, 'Result should be '\
          "a Clever::APIOperations::ResultsList, received #{result.inspect}"
        count = 0
        result.each do |elem|
          count += 1
          assert_type resource, elem
        end

        expected = resource.count
        count.must_equal expected, "Expected #{expected} #{name}s to be "\
          "retrieved but only #{count} were found. Perhaps the test data has changed?"
      end
    end

    should "find #{name}s with multiple ids" do
      VCR.use_cassette "#{name}_find_multiple" do
        to_query = []
        count = 0
        limit = 20
        resource.find(nil, limit: limit).take(limit).each do |elem|
          to_query << elem.id if count.even?
          count += 1
        end

        return if to_query.count == 0
        found = resource.find(to_query).map(&:id)
        assert_equal to_query.sort, found.sort, 'Elements found by querying by array of ids '\
          "should match the query itself. Expected: #{to_query.inspect}, found: #{found.inspect}"
      end
    end

    should "find a single #{name}" do
      VCR.use_cassette "#{name}_find_one" do
        id = resource.find.take(20).last.id
        elem = resource.find id
        assert_type resource, elem
        assert_equal id, elem.id
      end
    end

    should "retrieve all #{name}" do
      VCR.use_cassette("#{name}s") do
        elems = resource.all
        elems.each do |elem|
          assert_instance_of resource, elem, "All elems of #{resource.url} should be of "\
            "type #{resource.name}, instead got #{elem.class.name}. elem: #{elem.inspect}"
        end

        expected = resource.count
        elems.length.must_equal expected, "Expected #{expected} #{name}s to be "\
          "retrieved but only #{elems.length} were found. Perhaps the test data has changed?"
      end
    end
  end
end
