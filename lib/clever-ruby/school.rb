module Clever
  class School < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      [:state_id, :sis_id, :nces_id, :low_grade, :high_grade, :principal, :location, :phone]
    end

    [:teachers, :students, :sections].each do |name|
      define_method(name) do |filters = {}|
        get_linked_resources name.to_s, filters
      end
    end

    [:teacher_pages, :student_pages, :section_pages].each do |name|
      define_method(name) do |filters = {}|
        Clever::APIOperations::PageList.new(get_uri(name.to_s.gsub('_page', '')), filters)
      end
    end

  end
end
