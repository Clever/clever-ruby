module Clever
  class District < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      # All of a district's attributes are required.
      []
    end

    def schools(filters={})
      get_linked_resources 'schools', filters
    end

    def school_pages(filters={})
      Clever::APIOperations::PageList.new(get_uri('schools'), filters)
    end

    def teachers(filters={})
      get_linked_resources 'teachers', filters
    end

    def teacher_pages(filters={})
      Clever::APIOperations::PageList.new(get_uri('teachers'), filters)
    end

    def sections(filters={})
      get_linked_resources 'sections', filters
    end

    def section_pages(filters={})
      Clever::APIOperations::PageList.new(get_uri('sections'), filters)
    end

    def students(filters={})
      get_linked_resources 'students', filters
    end

    def student_pages(filters={})
      Clever::APIOperations::PageList.new(get_uri('students'), filters)
    end

    def events(filters={})
      get_linked_resources 'events', filters
    end

    def event_pages(filters={})
      Clever::APIOperations::PageList.new(get_uri('events'), filters)
    end

    private

    def get_linked_resources(resource_type, filters={})
      response = Clever.request(:get, get_uri(resource_type), filters)
      Util.convert_to_clever_object(response[:data])
    end

    def get_uri(resource_type)
      refresh
      links.detect {|link| link[:rel] == resource_type }[:uri]
    end
  end
end
