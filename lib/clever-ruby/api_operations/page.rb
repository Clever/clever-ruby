module Clever
  module APIOperations
    # Represents a page of data
    class Page
      include Enumerable

      # Request a page of data and store the results in this instance
      # @api semipublic
      # @return [Clever::APIOperations::Page]
      # @example
      #   page = Page.new '/v1.1/districts'
      def initialize(uri, filters = {})
        @uri = uri
        @filters = filters

        response = Clever.request :get, uri, filters
        @list = Util.convert_to_clever_object response[:data]
        @links = {}
        response[:links].each do |link|
          @links[link[:rel].to_sym] = link[:uri]
        end
      end

      # Gets next page if one is present, nil otherwise
      # @api semipublic
      # @return [Clever::APIOperations::Page, nil] Next page, or nil if last
      # @example
      #   next_page = page.next
      #   unless next_page.nil?
      #     next_page.each do |elem| puts elem; end
      def next
        @links.key?(:next) ? Page.new(@links[:next]) : nil
      end

      # Iterate over all elements in the page
      # @api semipublic
      # @return [Array] List of all elements
      # @example
      #   page.each { |elem| puts elem }
      def each(&blk)
        @list.each(&blk)
      end

      # Get all elements in page
      # @api semipublic
      # @return [Array] List of all elements
      # @example
      #   all_elems = page.all
      def all
        accum = []
        each do |elem|
          accum << elem
        end
        accum
      end
    end
  end
end
