module Clever
  module APIOperations
    class PageList
      def initialize(uri, filters={}, headers={})
        @uri = uri
        @filters = filters
        @headers = headers
      end

      def each
        current = 0
        total = 1
        while current < total
          page = Page.new(@uri, @filters.merge({ page: current + 1 }), @headers)

          yield page

          current = page.paging[:current]
          total = page.paging[:total]
        end
      end
    end
  end
end
