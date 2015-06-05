require 'test_helper'

describe Clever::NestedResource, :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  [Clever::District, Clever::School, Clever::Student,
   Clever::Event, Clever::Section, Clever::Teacher].each do |resource|
    next if resource.linked_resources.nil?
    resource.linked_resources.each do |link|
      it "retrieves a #{resource.shortname}'s #{link}" do
        result = resource.find.first.send link
        if Clever::Util.singular?(link.to_s)
          result.must_be_instance_of Clever::APIResource.named(link.to_s)
        else
          result.must_be_instance_of Clever::NestedResource
          result_size = result.size.to_i
          result_size.must_equal result.count # check count request measures actual data size
          result.respond_to?(:collection_count).must_equal true
        end
      end
    end
  end
end
