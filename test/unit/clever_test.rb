require 'test_helper'
require 'json'

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
    assert_equal 'v1.1/school_admins', Clever::SchoolAdmin.url
    assert_equal 'v1.1/district_admins', Clever::DistrictAdmin.url
  end

  it 'uri-encodes params' do
    query_string = Clever.convert_to_query_string created_at: '2013-02-15T 2:30:42Z'
    query_string.must_equal 'created_at=2013-02-15T%202:30:42Z'
  end

  describe '.create_request_opts' do
    before do
      method, url = 'get', 'quotes'
      params = { education: 'powerful weapon' }
      headers = { author: 'Nelson Mandela' }
      @options = Clever.create_request_opts method, url, params, headers
    end
    it 'sets method and url' do
      assert_equal 'get', @options[:method], 'Method not set properly'
      assert_equal(
        'https://api.clever.com/quotes?education=powerful%20weapon',
        @options[:url],
        'URL not formed properly with params')
    end
    it 'adds tracking headers' do
      headers = @options[:headers]
      assert headers.key?(:Authorization), 'Did not set authorization header'
      assert_match(/Bearer/, headers[:Authorization])
      assert headers.key?(:user_agent), 'Did not set User Agent header'
      assert_match %r{Clever/RubyBindings/}, headers[:user_agent]
      assert(
        headers.key?(:x_clever_client_user_agent),
        'Did not set Clever Client User Agent header')
      assert headers.key?(:author), 'Did not keep original header'

      custom_ua = JSON.parse(headers[:x_clever_client_user_agent], symbolize_names: true)
      assert custom_ua.key?(:lang), 'Did not set lang in custom user agent header'
      assert_equal custom_ua[:lang], 'ruby', 'Lang is not set to ruby'
      assert custom_ua.key?(:lang_version), 'Did not set lang_version in custom user agent header'
      assert custom_ua.key?(:platform), 'Did not set platform in custom user agent header'
      assert custom_ua.key?(:uname), 'Did not set uname in custom user agent header'
      assert custom_ua.key?(:publisher), 'Did not set publisher in custom user agent header'
      assert_equal custom_ua[:publisher], 'clever', 'Did not set publisher to clever'
      assert custom_ua.key?(:bindings_version), 'Did not set bindings_version'
    end
  end
end
