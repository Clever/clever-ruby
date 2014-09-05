module Clever
  # Student resource
  class Student < APIResource
    include Clever::APIOperations::List
    @linked_resources = [:teachers, :sections, :schools, :districts, :events, :contacts]

    def optional_attributes
      [:student_number, :state_id, :location, :gender, :dob, :grade, :frl_status,
       :race, :hispanic_ethnicity, :email, :credentials]
    end

    def photo
      return @values[:photo] if @values.key? :photo
      response = Clever.request :get, photo_url
      @values[:photo] = response[:data][:data]
    end

    private

    def photo_url
      url + '/photo'
    end
  end
end
