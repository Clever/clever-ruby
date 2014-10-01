$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'minitest/autorun'
require 'minispec-metadata'
require 'vcr'
require 'minitest-vcr'
require 'clever-ruby'

questionmark_agnostic_matcher = lambda do |request1, request2|
  request1.uri.sub(/\?\z/, '') == request2.uri.sub(/\?\z/, '')
end

VCR.configure do |c|
  c.default_cassette_options = { match_requests_on: [:method, questionmark_agnostic_matcher] }
  c.cassette_library_dir = 'test/data/vcr_cassettes'
  c.hook_into :webmock
end
MinitestVcr::Spec.configure!
