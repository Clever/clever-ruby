require "clever-ruby"
require 'webmock/rspec'

describe Clever::EventsApi do
  before(:each) do
    WebMock.disable_net_connect!(allow_localhost: true)
    @api_instance = Clever::EventsApi.new
    Clever.configure do |config|
      config.access_token = 'TEST_TOKEN'
    end

    file = File.read('spec/events.json')
    stub_request(:get, /api.clever.com/).
      to_return(status: 200, body: file, headers: {})
  end

  describe ".get_events" do
    context "given events exist" do
      it "does not raise an error" do
        expect{@api_instance.get_events}.to_not raise_error
      end

      context "students events" do
        it "has the id and type" do
          @api_instance.get_events.data.each do |event|
            expect(event.data.id).not_to be nil
            expect(event.data.type).not_to be nil
          end
        end
      end
    end
  end
end
