module Clever
  # Student resource
  class Student < APIResource
    include Clever::APIOperations::List
    @linked_resources = [:school, :district, :sections, :teacher, :events]

    # Get contacts for the current student
    # @todo This is not implemented!
    # @api public
    # @raise [NotImplementedError]
    # @return [Object]
    # @example
    #   student = student.retrieve id
    #   contacts = student.admins
    def contacts
      fail NotImplementedError, 'contacts nested resource not implemented yet.'
    end

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
