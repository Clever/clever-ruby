require 'clever-ruby'

# Setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'TEST_TOKEN'
end

api_instance = Clever::DataApi.new
# events_instance = Clever::EventsApi.new

begin
  students = api_instance.get_students()
  p students

end