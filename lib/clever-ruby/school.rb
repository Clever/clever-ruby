module Clever
  # School resource
  class School < APIResource
    include Clever::APIOperations::List
    @linked_resources = [:students, :district, :sections, :teachers, :events]

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:state_id, :sis_id, :nces_id, :low_grade, :high_grade, :principal, :location, :phone]
    end
  end
end
