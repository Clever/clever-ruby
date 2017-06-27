require "clever-ruby"
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)


describe Clever::EventsApi do
  before(:each) do
    @api_instance = Clever::EventsApi.new
    Clever.configure do |config|
      config.access_token = 'DEMO_TOKEN'
    end

    file = File.read('spec/events.json')
    stub_request(:get, /api.clever.com/).
      to_return(status: 200, body: file, headers: {})
  end

  describe ".get_events" do
    context "given events exist" do
      it "returns the events" do
        expect{@api_instance.get_events}.to_not raise_error
      end
    end
  end
end
