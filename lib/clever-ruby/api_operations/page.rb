module Clever
  module APIOperations
    # Represents a page of data
    class Page
      include Enumerable

      attr_accessor :paging
      attr_accessor :links

      def initialize(uri, filters = {})
        @uri = uri
        @filters = filters

        response = Clever.request :get, uri, filters
        @list = Util.convert_to_clever_object response[:data]
        self.paging = response[:paging]
        self.links = {}
        response[:links].each do |link|
          links[link[:rel].to_sym] = link[:uri]
        end
      end

      def each(&blk)
        @list.each(&blk)
      end

      # TODO: remove this
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
