module Clever
  # Section resource
  class Section < APIResource
    include Clever::APIOperations::List
    @uri = 'sections'
    @plural = 'sections'
    @linked_resources = [:school, :district, :students, :teacher, :events]

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:teacher, :course_name, :course_description, :course_number, :period, :grade, :term]
    end
  end
end
