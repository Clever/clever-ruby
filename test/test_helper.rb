$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'minitest/autorun'
require 'shoulda'
require 'vcr'
require 'clever-ruby'
require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = 'test/data/vcr_cassettes'
  c.hook_into :webmock
end
