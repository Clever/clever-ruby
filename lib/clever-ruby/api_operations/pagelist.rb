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
        page = Page.new @uri
        until page.first.nil?
          yield page

          if page.links.key? :next
            page = Page.new page.links[:next]
          else
            break
          end
        end
      end
    end
  end
end
