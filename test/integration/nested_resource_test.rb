require 'test_helper'

describe Clever::NestedResource, :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  [Clever::District, Clever::School, Clever::Student,
   Clever::Event, Clever::Section, Clever::Teacher,
   Clever::SchoolAdmin, Clever::DistrictAdmin].each do |resource|
    next if resource.linked_resources.nil?
    resource.linked_resources.each do |link|
      it "retrieves a #{resource.shortname}'s #{link}" do
        result = resource.find.first.send link
        if Clever::APIResource.singular?(link.to_s)
          result.must_be_instance_of Clever::APIResource.named(link.to_s)
        else
          result.must_be_instance_of Clever::NestedResource
          result.size.must_equal result.count # check count request measures actual data size
        end
      end
    end
  end

  it 'must include auth_token in linked_resources' do
    school = Clever::District.find.first.send(:schools).first
    school.auth_token.must_equal 'DEMO_TOKEN'
  end
end
