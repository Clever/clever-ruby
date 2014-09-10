module Clever
  module APIOperations
    # Represents a list of results for a paged request.
    class ResultsList
      include Enumerable

      def initialize(pagelist)
        @pages = pagelist
      end

      def each
        @pages.each do |page|
          page.each do |elem|
            yield elem
          end
        end
      end
    end
  end
end
