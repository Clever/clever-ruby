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

    def teachers(filters={})
      get_linked_resources 'teachers', filters
    end

    def sections(filters={})
      get_linked_resources 'sections', filters
    end

    def students(filters={})
      get_linked_resources 'students', filters
    end

    def events(filters={})
      # It would be nice if events was a linked resource from district
      # so that we could similarly do:
      # get_linked_resources 'events', filters
      response = Clever.request(:get, "#{url}/events", filters)
      Util.convert_to_clever_object(response[:data])
    end

    private

    def get_linked_resources(resource_type, filters={})
      refresh
      uri = links.detect {|link| link[:rel] == resource_type }[:uri]
      response = Clever.request(:get, uri, filters)
      Util.convert_to_clever_object(response[:data])
    end
  end
end
