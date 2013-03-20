require 'test_helper'

class EventTest < Test::Unit::TestCase
  def setup
    @event = Clever::Event.construct_from({
      type: "sections.created",
      data: {
        object: {
          id: "512bb9f2ca5e6fa77506133f"
        }
      },
      id: "512bb9f2ca5e6fa775061340"
    })

    @updated_event = Clever::Event.construct_from({
      type: "sections.updated",
      data: {
        object: {
          id: "510980c2923bcbba1f0ce5dd"
        },
        previous_attributes: {
          teacher: "510980a6923bcbba1f0cb500",
          last_modified: "2013-03-11T15:38:58.558Z"
        }
      },
      id: "514767bf80833fb55b1c2dd7"
    })
  end

  should "create a clever object for the object the event is about" do
    @event.object.must_be_instance_of Clever::Section
  end

  should "know what action the event is about (created/updated/deleted)" do
    @event.action.must_equal "created"
  end

  should "have an empty hash if there aren't previous attributes" do
    @event.previous_attributes.must_equal {}
  end

  should "have an event's previous attributes" do
    @updated_event.previous_attributes[:teacher].must_equal "510980a6923bcbba1f0cb500"
  end
end