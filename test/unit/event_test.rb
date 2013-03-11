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
  end

  should "create a clever object for the object the event is about" do
    @event.object.must_be_instance_of Clever::Section
  end

  should "know what action the event is about (created/updated/deleted)" do
    @event.action.must_equal "created"
  end
end