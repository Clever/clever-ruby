module Clever
  module APIOperations
    # Handles paginated requests.
    # TODO: use rel links
    # TODO: build functionality elsewhere
    class PageList
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
    end
  end
end
