module Clever
  # District resource
  class District < APIResource
    include Clever::APIOperations::List
    @linked_resources = [:schools, :teachers, :sections, :students, :events]

    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      # All of a district's attributes are required.
      []
    end

    [:school_pages, :teacher_pages, :section_pages, :student_pages, :event_pages].each do |name|
      define_method(name) do |filters = {}|
        Clever::APIOperations::PageList.new get_uri(name.to_s.gsub('_page', '')), filters
      end
    end

    private

    # Get the URI for a hypermedia link
    # @api private
    # @return [String]
    def get_uri(resource_type)
      refresh
      links.find { |link| link[:rel] == resource_type }[:uri]
    end
  end
end
