module Clever
  # District resource
  class District < APIResource
    include Clever::APIOperations::List
    @plural = 'districts'
    @uri = 'districts'
    @linked_resources = [:schools, :teachers, :sections, :students, :events]

    # Get admins for the current district
    # @todo This is not implemented!
    # @api public
    # @raise [NotImplementedError]
    # @return [Object]
    # @example
    #   district = district.retrieve id
    #   admins = district.admins
    def admins
      fail NotImplementedError, 'admins nested resource not yet implemented.'
    end

    # Get status of the current district
    # @todo This is not implemented!
    # @api public
    # @raise [NotImplementedError]
    # @return [Object]
    # @example
    #   district = district.retrieve id
    #   puts district.status
    def status
      fail NotImplementedError, 'status nested resource not yet implemented.'
    end

    # Get district admins for the current district
    # @api public
    # @return [Object]
    # @example
    #   district = district.retrieve id
    #   district_admins = district.district_admins
    def district_admins(filters = {})
      # The response for a district does not include a link to the district
      # admins URI, so this can't be a linked_resource.
      Clever::NestedResource.new '/v1.1/district_admins', filters, headers
    end

    # Get school admins for the current district
    # @api public
    # @return [Object]
    # @example
    #   district = district.retrieve id
    #   school_admins = district.school_admins
    def school_admins(filters = {})
      # The response for a district does not include a link to the school
      # admins URI, so this can't be a linked_resource.
      Clever::NestedResource.new '/v1.1/school_admins', filters, headers
    end

    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      # All of a district's attributes are required.
      []
    end

    # TODO: remove
    [:school_pages, :teacher_pages, :section_pages, :student_pages, :event_pages].each do |name|
      define_method(name) do |filters = {}|
        Clever::APIOperations::PageList.new get_link_uri(name.to_s.gsub('_page', '')),
                                            filters,
                                            headers
      end
    end
  end
end
