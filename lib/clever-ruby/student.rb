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

    [:sections, :school, :district, :teachers].each do |name|
      define_method(name) do |filters = {}|
        get_linked_resources name.to_s, filters
      end
    end

    [:section_pages, :teachers_pages].each do |name|
      define_method(name) do |filters = {}|
        Clever::APIOperations::PageList.new(get_uri(name.to_s.gsub('_page', '')), filters)
      end
    end

    private

    def photo_url
      url + '/photo'
    end
  end
end
