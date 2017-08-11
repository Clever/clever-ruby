require "clever-ruby"
require 'webmock/rspec'

describe Clever::EventsApi do
  before(:each) do
    WebMock.disable_net_connect!(allow_localhost: true)
    @api_instance = Clever::EventsApi.new
    Clever.configure do |config|
      config.access_token = 'DEMO_TOKEN'
    end
  end

  describe ".get_events" do
    before(:each) do
      file = File.read('spec/events.json')
      stub_request(:get, /api.clever.com/).
          to_return(status: 200, body: file, headers: {})
    end

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

  describe ".get_empty_grade_event" do
    before(:each) do
      file = File.read('spec/empty_grade_fields.json')
      stub_request(:get, /api.clever.com/).
          to_return(status: 200, body: file, headers: {})
    end

    context "empty grade events exist" do
      it "does not raise an error" do
        expect {@api_instance.get_events}.to_not raise_error
      end
    end
  end

end
