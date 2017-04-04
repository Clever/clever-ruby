require 'clever-api'

# Setup authorization
CleverAPI.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'DEMO_TOKEN'
end

api_instance = CleverAPI::DefaultApi.new

begin
  #students = api_instance.get_students()
  #p students

  event = api_instance.get_event("58c854e71e23b6f39850be27")
  p "Event", event

  events = api_instance.get_events({:limit => 5})
  puts "Events ", events.data

end