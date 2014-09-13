module Clever
  # An interface for querying nested resources
  class NestedResource
    include Clever::APIOperations::NestedList
    include Enumerable

    # Create a nested resource
    # @api private
    # @return [Clever::APIOperations::NestedList]
    def initialize(uri, filters = {})
      @uri = uri
      @filters = filters
      @results_list = Clever::APIOperations::PageList.new(uri, filters).to_results_list
    end

    # Query and iterate over results for the params provided during initialization
    # @api public
    # @return [Clever::APIOperations::NestedResource] self
    # @example
    #   district = Clever::Districts.retrieve id
    #   district.schools.each { |school| puts school.name }
    def each(&blk)
      @results_list.each(&blk)
      self
    end

    # Query for all results and count them
    # @api public
    # @note This queries for the actual elements! If you wish to just do a
    #   count query, use the count method
    # @return [Integer]
    # @example
    #   district = Clever::District.retrieve id
    #   num_schools_for_district = district.schools.length
    def length
      @results_list.count
    end
    alias_method :size, :length
  end
end
