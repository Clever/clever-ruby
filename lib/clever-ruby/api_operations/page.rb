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
    end
  end
end
