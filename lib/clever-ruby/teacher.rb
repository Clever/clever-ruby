module Clever
  # Teacher resource
  class Teacher < APIResource
    include Clever::APIOperations::List
    @linked_resources = [:school, :district, :students, :sections, :events]

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:email, :teacher_number, :title]
    end
  end
end
