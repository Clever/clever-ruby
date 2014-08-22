module Clever
  class Student < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      [:student_number, :state_id, :location, :gender, :dob, :grade, :frl_status, :race, :hispanic_ethnicity, :email, :credentials]
    end

    def photo
      return @values[:photo] if @values.has_key?(:photo)
      response = Clever.request(:get, photo_url)
      @values[:photo] = response[:data][:data]
    end

    private

    def photo_url
      url + '/photo'
    end
  end
end
