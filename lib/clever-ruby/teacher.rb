module Clever
  class Teacher < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      [:email, :teacher_number, :title]
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

  end
end
