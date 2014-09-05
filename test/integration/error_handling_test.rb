require 'test_helper'

# Test error handling
class ErrorHandlingTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = 'DEMO_KEY'
    end
  end

  should 'raise an InvalidRequestError when given a bad created_since' do
    VCR.use_cassette('error_handling') do
      @district = Clever::District.all.first
      lambda do
        @district.events created_since: '2013-02-15T 2:30:42 0000'
      end.must_raise Clever::InvalidRequestError
    end
  end
end
