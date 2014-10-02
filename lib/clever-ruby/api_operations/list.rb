module Clever
  # API Operations
  module APIOperations
    # A list of API resource instances
    module List
      # Class methods for those that include List
      # @api public
      module ClassMethods
        # Get all elements of a resource
        # @api public
        # @deprecated This can be costly since it places all matching elements
        #   in memory. Instead just iterate over the collection using each.
        # @param filters [Hash] parameters to apply, as per the Clever API spec
        # @return [Array] array of all elements matching the request
        # @example
        #   Clever::District.all
        def all(filters = {}, headers = {})
          accum = []
          Clever::APIOperations::PageList.new(url, filters, headers).each do |page|
            accum += page.all
          end
          accum
        end

        # Get elements of a resource. Supports 1 or more ids, or open-ended query
        # @api public
        # @param id [String, Array, nil] ID or array of ids to match, or nil
        #   for query
        # @param filters [Hash, nil] Query parameters to pass, as per Clever API spec
        # @return [Clever::APIResource, Clever::APIOperations::ResultsList]
        #   single resource or iterable list of results
        # @raise [ArgumentError] Bad ID/IDs provided
        # @example
        #   # Get first 20 clever districts
        #   districts = Clever::District.find.take 20
        #
        #   # Get specific district
        #   id = '...'
        #   district = Clever::District.find id
        #
        #   # Get districts with given ids
        #   ids = ['...', '...']
        #   districts = Clever::District.find ids
        def find(id = nil, filters = {}, headers = {})
          if id.is_a? Array
            unless id.select { |e| !Clever::Util.valid_id? e }.empty?
              fail ArgumentError, 'Array of IDs must only contain valid ObjectIDs'
            end

            filters[:where] = JSON.dump(_id: { :'$in' => id })
          end

          if id.nil? || id.is_a?(Array)
            Clever::APIOperations::PageList.new(url, filters, headers).to_results_list
          elsif Clever::Util.valid_id? id
            retrieve id
          else
            fail ArgumentError, 'id must be a valid ObjectID, an array of them, or nil.'
          end
        end

        # Query for the first element or n elements in the resource
        # @api public
        # @param num [nil, Integer] If nil, first elem; else, num elems to fetch
        # @param filters [Hash] Filters to request with, as per Clever API spec
        # @return [CleverObject, Clever::APIOperations::Page] elem, or
        #   elems found.
        # @example
        #   first_elem = Clever::District.first
        #   first_elems = Clever::District.first 20
        #   first_elems.each do |e|
        #     puts e.name
        #   end
        def first(num = nil, filters = {}, headers = {})
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
        # @param filters [Hash] Filters to request with, as per Clever API spec
        # @return [CleverObject, Clever::APIOperations::ResultsList] elem, or
        #   elems found. If list, sorted in ascending order of ids.
        # @example
        #   last_elem = Clever::District.last
        #   last_elems = Clever::District.last 20
        #   last_elems.each do |e|
        #     puts e.name
        #   end
        def last(num = nil, filters = {}, headers = {})
          filters[:ending_before] = 'last'
          if num.nil?
            filters[:limit] = 1
            response = Clever.request :get, url, filters, headers
            Util.convert_to_clever_object response[:data].last
          else
            filters[:limit] = num
            Clever::APIOperations::PageList.new(url, filters, headers).to_results_list
          end
        end

        # Query for the last element or n elements in the resource
        # @api public
        # @param num [nil, Integer] If nil, last elem; else, num elems to fetch
        # @param filters [Hash] Filters to request with, as per Clever API spec
        # @return [CleverObject, Clever::APIOperations::ResultsList] elem, or
        #   elems found. If list, sorted in ascending order of ids.
        # @example
        #   last_elem = Clever::District.last
        #   last_elems = Clever::District.last 20
        #   last_elems.each do |e|
        #     puts e.name
        #   end
        def last(num = nil, filters = {}, headers = {})
          filters[:ending_before] = 'last'
          if num.nil?
            filters[:limit] = 1
            response = Clever.request :get, url, filters, headers
            Util.convert_to_clever_object response[:data].last
          else
            filters[:limit] = num
            Clever::APIOperations::PageList.new(url, filters, headers).to_results_list
          end
        end

        # Requests number of elements matching the query
        # @api public
        # @param filters [Hash, nil] Query parameters to pass, as per Clever API spec
        # @return [Integer] Number of elements matching
        # @example
        #   num_districts = Clever::District.count
        def count(filters = {}, headers = {})
          filters[:count] = true
          response = Clever.request :get, url, filters, headers
          response[:count]
        end
      end

      # Add ClassMethods to classes that include List
      # @api private
      # @return [nil]
      def self.included(base)
        base.extend ClassMethods
      end
    end
  end
end
