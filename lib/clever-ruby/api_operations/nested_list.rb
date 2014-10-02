module Clever
  module APIOperations
    # Methods for interacting with the API on nested resources
    # TODO: find a way to not duplicate list.rb code
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
        Clever::APIOperations::PageList.new(@uri, filters, headers).to_results_list
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
        response = Clever.request :get, @uri, filters, headers
        response[:count]
      end

      # Query for the first element or n elements in the resource
      # @api public
      # @param num [nil, Integer] If nil, last elem; else, num elems to fetch
      # @param filters [Hash] Filters to request with, as per Clever API spec
      # @return [CleverObject, Clever::APIOperations::Page] elem, or
      #   elems found. If list, sorted in ascending order of ids.
      # @example
      #   first_elem = Clever::District.first
      #   first_elems = Clever::District.first 20
      #   first_elems.each do |e|
      #     puts e.name
      #   end
      def first(num = nil, filters = {})
        filters = @filters.merge filters
        if num.nil?
          filters[:limit] = 1
          response = Clever.request :get, url, filters, headers
          Util.convert_to_clever_object response[:data].last
        else
          filters[:limit] = num
          Clever::APIOperations::PageList.new(url, filters, headers).first
        end
      end

      # Query for the last element or n elements in the resource
      # @api public
      # @param num [nil, Integer] If nil, last elem; else, num elems to fetch
      # @return [CleverObject, Clever::APIOperations::ResultsList] elem, or
      #   elems found. If list, sorted in ascending order of ids.
      # @example
      #   last_elem = Clever::District.last
      #   last_elems = Clever::District.last 20
      #   last_elems.each do |e|
      #     puts e.name
      #   end
      def last(num = nil, filters = {})
        filters = @filters.merge filters
        filters[:ending_before] = 'last'
        if num.nil?
          filters[:limit] = 1
          response = Clever.request :get, @uri, filters, headers
          Util.convert_to_clever_object response[:data].last
        else
          filters[:limit] = num
          Clever::APIOperations::PageList.new(@uri, filters, headers).to_results_list
        end
      end
    end
  end
end
