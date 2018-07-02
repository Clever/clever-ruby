require "clever-ruby"
require 'webmock/rspec'

describe Clever::DataApi do
  before(:each) do
    WebMock.allow_net_connect!
    @api_instance = Clever::DataApi.new
    Clever.configure do |config|
      config.access_token = 'TEST_TOKEN'
    end
  end

  describe ".get_contacts_for_student" do
    it "returns array of StudentContacts" do
      student_id = "58da8c63d7dc0ca0680003ed"
      contacts = @api_instance.get_contacts_for_student(student_id).data
      expect(contacts.length).to eq(1)
      expect(contacts.first.class).to eq(Clever::StudentContact)
      expect(contacts.first.id).not_to be nil
    end
  end

  describe ".get_contacts" do
    it "returns array of StudentContactResponses" do
      contacts = @api_instance.get_contacts.data
      expect(contacts).not_to be_empty
      expect(contacts.first.class).to eq(Clever::StudentContactResponse)
      expect(contacts.first.data.class).to eq(Clever::StudentContact)
      expect(contacts.first.data.id).not_to be nil
    end
  end
end
