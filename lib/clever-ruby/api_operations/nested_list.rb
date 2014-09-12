module Clever
  module APIOperations
    # Methods for interacting with the API on nested resources
    module NestedList
      # Query a nested list with Clever API params, overriding initialized keys
      # @api public
      # @note You don't need to call this if you aren't using additional filters;
      #   instead just iterate on the NestedResource itself.
      # @param filters [Hash] Parameters to use
      # @return [Clever::APIOperations::ResultList] list of results
      # @example
      #   # Without any overriding
      #   district = Clever::Districts.retrieve id
      #   district.schools.find(starting_after: lower_bound).each do |school|
      #     puts school.name
      #   end
      #
      #   # With overriding
      #   district = Clever::Districts.retrieve id
      #   schools = district.schools(starting_after: lower_bound)
      #   # The above filter has been overridden for the query below!
      #   schools.find(starting_after: even_lower_bound).each do |school|
      #     puts school.name
      #   end
      def find(filters = {})
        filters = @filters.merge filters
        Clever::APIOperations::PageList.new(@uri, filters).to_results_list
      end

      # Request the number of elements in a nested list from the API
      # @note This does not count a data structure in memory; it runs an HTTP query!
      # @api public
      # @param filters [Hash] Parameters to use
      # @return [Integer] Results
      # @example
      #   district = Clever::Districts.retrieve id
      #   num_schools_in_district = district.schools.count
      def count(filters = {})
        filters = @filters.merge filters
        filters[:count] = true
        response = Clever.request :get, @uri, filters
        response[:count]
      end
    end
  end
end
