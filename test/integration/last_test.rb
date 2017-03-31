require 'test_helper'

describe 'last method', :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  # The DistrictAdmin resource does not support the last method (limit parameter)
  resources = [Clever::District, Clever::School, Clever::Student,
               Clever::Event, Clever::Section, Clever::Teacher,
               Clever::SchoolAdmin]

  describe 'page' do
    it 'has working first and last methods' do
      resources.each do |resource|
        page = Clever::APIOperations::Page.new resource.url
        list = page.all

        page.first.must_equal list.first
        page.last.must_equal list.last
        page.first(10).must_equal list.first(10)
        page.last(10).must_equal list.last(10)
      end
    end
  end

  describe 'nested resource' do
    it 'has working first and last methods' do
      resources.each do |resource|
        resource.linked_resources do |l|
          nested = resource.first.send l
          nested_resource = Clever::APIResource.named l
          if Clever::APIResource.singular? l
            nested.first.must_be_instance_of nested_resource
          else
            nested.first.must_be_instance_of nested_resource
            nested.first(10).each do |e|
              e.must_be_intsance_of nested_resource
            end

            last = nested.last
            last.must_be_instance_of nested_resource
            count = 0
            nested.last(10).each do |e|
              e.must_be_intsance_of nested_resource
              e.must_equal last if count == 19
              count += 1
            end
          end
        end
      end
    end
  end
end
