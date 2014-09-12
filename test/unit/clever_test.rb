require 'test_helper'

# basic clever-ruby tests
# TODO: organize better
describe Clever do
  before do
    Clever.configure do |config|
      config.token = 'DEMO_TOKEN'
    end
  end

  it 'returns correct urls for Resources' do
    assert_equal 'v1.1/districts', Clever::District.url
    assert_equal 'v1.1/schools', Clever::School.url
    assert_equal 'v1.1/students', Clever::Student.url
    assert_equal 'v1.1/sections', Clever::Section.url
    assert_equal 'v1.1/teachers', Clever::Teacher.url
    assert_equal 'v1.1/events', Clever::Event.url
  end

  it 'uri-encodes params' do
    query_string = Clever.convert_to_query_string created_at: '2013-02-15T 2:30:42Z'
    query_string.must_equal 'created_at=2013-02-15T%202:30:42Z'
  end
end
