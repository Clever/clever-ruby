module Clever
  class Event < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      []
    end

    def object
      klass = Util.types_to_clever_class(type_pieces[0])
      klass ||= CleverObject
      klass.construct_from(data[:object])
    end

    def previous_attributes
      data[:previous_attributes]
    end

    def action
      type_pieces[1]
    end

    private

    def type_pieces
      type.split(".")
    end
  end
end
