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

    private

    def get_linked_resources(resource_type, filters={})
      Util.convert_to_clever_object(Clever.request(:get, get_uri(resource_type), filters)[:data])
    end

    def get_uri(resource_type)
      refresh
      links.detect {|link| link[:rel] == resource_type }[:uri]
    end
  end
end
