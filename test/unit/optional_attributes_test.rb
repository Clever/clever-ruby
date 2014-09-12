require 'test_helper'

# Test optional attributes functionality
describe 'Optional attributes', :vcr do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  it 'returns nil for an optional attribute that isnt present' do
    school = Clever::School.new 1

    # Must not raise a NoMethodError.
    school.state_id.must_equal nil
  end

  it 'has the expected value for an optional attribute that is present' do
    school = Clever::School.find '530e595026403103360ff9fd'
    school.state_id.must_equal '712345'
  end

  it 'raises a NoMethodError for an invalid attribute' do
    school = Clever::School.new 1
    -> { school.some_attribute_that_doesnt_exist }.must_raise NoMethodError
  end
end
