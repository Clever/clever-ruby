module Clever
  # Student resource
  class Student < APIResource
    include Clever::APIOperations::List
    @uri = 'students'
    @plural = 'students'
    @linked_resources = [:school, :district, :sections, :teachers, :events, :contacts]

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:student_number, :state_id, :location, :gender, :dob, :grade, :frl_status,
       :race, :hispanic_ethnicity, :email, :credentials]
    end
  end
end
