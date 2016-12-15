require 'test_helper'

def resource_name(resource)
  resource.shortname
end

# The DistrictAdmin resource does not support the count or limit parameters
def resources_wo_district_admin
  [Clever::District, Clever::School, Clever::Teacher,
   Clever::Student, Clever::Section, Clever::Event,
   Clever::SchoolAdmin]
end

def resources
  resources_wo_district_admin + [Clever::DistrictAdmin]
end

module Minitest
  # Extend default Minitest assertions
  module Assertions
    def assert_resource_type(resource, elem)
      assert_instance_of resource, elem, "All elems of #{resource.url} should be of "\
        "type #{resource.name}, instead got #{elem.class.name}. elem: #{elem.inspect}"
    end
  end
end

# Test api_operations/List
describe Clever::APIOperations::List, :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  [[Clever::District, 1], [Clever::School, 3], [Clever::Teacher, 89],
   [Clever::Student, 1004], [Clever::Section, 379], [Clever::Event, 7],
   [Clever::SchoolAdmin, 1]].each do |test_data|
    resource, expected = test_data
    name = resource_name resource

    it "counts #{name} properly" do
      count = resource.count
      assert count.is_a?(Integer), "count should return an Integer. count: #{count}"
      assert_equal expected, count, "Expected #{expected} #{name}s to exist, "\
        "but only #{count} were found. Perhaps the test data has changed?"
    end
  end

  resources.each do |resource|
    name = resource_name resource

    it "rejects invalid id for #{resource}.find one" do
      id = 'invalid_id'
      assert_raises(ArgumentError) { resource.find id }
    end

    it "finds a single #{name}" do
      id = resource.find.take(20).last.id
      elem = resource.find id
      assert_resource_type resource, elem
      assert_equal id, elem.id
    end
  end

  resources_wo_district_admin.each do |resource|
    name = resource_name resource

    it 'rejects invalid ids for Clever::District.find multiple' do
      # one valid, one invalid
      ids = %w(123412341234123412341234 invalid_id)
      assert_raises(ArgumentError) { Clever::District.find ids }
    end

    it "finds #{name}s with multiple ids" do
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

    it "finds #{name}s by page" do
      result = resource.find
      assert_instance_of Clever::APIOperations::ResultsList, result, 'Result should be '\
        "a Clever::APIOperations::ResultsList, received #{result.inspect}"
      count = 0
      result.each do |elem|
        count += 1
        assert_resource_type resource, elem
      end

      expected = resource.count
      count.must_equal expected, "Expected #{expected} #{name}s to be "\
        "retrieved but only #{count} were found. Perhaps the test data has changed?"
    end

    it "retrieves all #{name}" do
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
