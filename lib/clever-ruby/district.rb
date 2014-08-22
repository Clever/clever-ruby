module Clever
  class District < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      # All of a district's attributes are required.
      []
    end

    [:schools, :teachers, :sections, :students, :events].each do |name|
      define_method(name) do |filters = {}|
        get_linked_resources name.to_s, filters
      end
    end

    [:school_pages, :teacher_pages, :section_pages, :student_pages, :event_pages].each do |name|
      define_method(name) do |filters = {}|
        Clever::APIOperations::PageList.new(get_uri(name.to_s.gsub('_page', '')), filters)
      end
    end

  end
end
