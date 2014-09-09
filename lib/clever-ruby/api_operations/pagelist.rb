module Clever
  module APIOperations
    # Handles paginated requests.
    class PageList
      include Enumerable

      def initialize(uri, filters = {})
        @uri = uri
        @filters = filters
      end

      def each
        page = Page.new @uri, @filters
        until page.nil?
          yield page
          page = page.next
        end
      end

      def to_results_list
        Clever::APIOperations::ResultsList.new self
      end
    end
  end
end
