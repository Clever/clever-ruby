module Clever
  # Event resource
  class Event < APIResource
    include Clever::APIOperations::List

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      []
    end

    # Get object corresponding to this event
    # @api public
    # @return [CleverObject]
    # @example
    #   district = event.object
    def object
      klass = APIResource.named type_pieces[0]
      klass ||= CleverObject
      klass.construct_from data[:object]
    end

    # Get previous attributes before the event
    # @api public
    # @return [Hash]
    # @example
    #   prev = event.previous_attributes
    def previous_attributes
      data[:previous_attributes]
    end

    # Get action taken in Event
    # @api public
    # @return [String]
    # @example
    #   action = event.action
    def action
      type_pieces[1]
    end

    # Get URL for events endpoint
    # @api private
    # @return [String]
    def self.url
      'v1.1/events'
    end

    private

    # Split type of Event into pieces
    # @api private
    # @return [Array]
    def type_pieces
      type.split '.'
    end
  end
end
