module Clever
  module APIOperations
    # Represents a page of data
    class Page
      include Enumerable

      # Request a page of data and store the results in this instance
      # @api private
      # @return [Clever::APIOperations::Page]
      # @example
      #   page = Page.new '/v1.1/districts'
      def initialize(uri, filters = {}, headers = {})
        @uri = uri
        @filters = filters
        @headers = headers

        response = Clever.request :get, uri, filters, @headers
        standardize_response(response)

        @auth_token = @headers[:Authorization].split[1]
        response[:data].map { |x| x[:data][:auth_token] = @auth_token }

        @all = Util.convert_to_clever_object response[:data]
        @links = {}
        response[:links].each do |link|
          @links[link[:rel].to_sym] = link[:uri]
        end
      end

      # Gets next page if one is present, nil otherwise
      # @api private
      # @return [Clever::APIOperations::Page, nil] Next page, or nil if last
      # @example
      #   next_page = page.next
      #   unless next_page.nil?
      #     next_page.each do |elem| puts elem; end
      def next
        @links.key?(:next) ? Page.new(@links[:next], {}, @headers) : nil
      end

      # Iterate over all elements in the page
      # @api private
      # @return [Array] List of all elements
      # @example
      #   page.each { |elem| puts elem }
      def each(&blk)
        @all.each(&blk)
      end

      # Get all elements in page
      # @api private
      # @return [Array] List of all elements
      # @example
      #   all_elems = page.all
      attr_reader :all

      # Retrieve the last element or n elements in the resource
      # @api public
      # @param num [nil, Integer] If nil, last elem; else, num elems to fetch
      # @return [CleverObject, Clever::APIOperations::Page] elem, or
      #   elems found. If list, sorted in ascending order of ids.
      # @example
      #   elems = Clever::District.first(20)
      #   last_elem = elems.last
      #   last_elems = elems.last 5
      def last(num = nil)
        return @all.last num if num
        @all.last
      end

      private

      # District_admins API returns slightly different response, so need to standardize it
      # @api private
      # @returns response with each elem in [:data] containing a hash with :data and :uri keys,
      #   unless already in that format
      # @example
      #   input:
      #     {data: [{id: 1, email: 'admin1@school.edu'},
      #             {id: 2, email: 'admin2@school.edu'}]}
      #   output:
      #     {data: [{data: {id: 1, email: 'admin1@school.edu'}, uri: '/v1.1/district_admins/1'},
      #             {data: {id: 2, email: 'admin2@school.edu'}, uri: '/v1.1/district_admins/2'}]}
      def standardize_response(response)
        return if response[:data].empty? || response[:data][0].key?(:data) # not district_admin
        response[:data].each_with_index do |elem, i|
          response[:data][i] = {
            data: elem,
            uri: "#{@uri}/#{elem[:id]}"
          }
        end
      end
    end
  end
end
