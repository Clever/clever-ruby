module Clever
  module APIOperations
    class PageList
      def initialize(uri, filters={})
        @uri = uri
        @filters = filters
      end

      def each
        current_page = 1
        begin
          page = Page.new(@uri, @filters.merge({ page: current_page }))
          yield page
          current_page = page.paging[:current] + 1
        end until page.paging[:current] == page.paging[:total]
      end
    end
  end
end