module Clever
  module APIOperations
    class PageList
      def initialize(uri, filters={})
        @uri = uri
        @filters = filters
      end
      
      def collect(&block)
        accum = []
        each {|page| accum += block.call(page) }
        accum
      end

      def each
        current = 0
        total = 1
        while current < total
          page = Page.new(@uri, @filters.merge({ page: current + 1 }))

          yield page

          current = page.paging[:current]
          total = page.paging[:total]
        end
      end
    end
  end
end