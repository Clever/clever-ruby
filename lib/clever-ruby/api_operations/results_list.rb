module Clever
  module APIOperations
    # Represents a list of results for a paged request.
    class ResultsList
      include Enumerable

      # Create a results list from a PageList
      # @api private
      # @return [ResultsList]
      def initialize(pagelist)
        @pages = pagelist
      end

      # Collect the total count of items in the collection from the first
      # page's metadata
      # @api public
      # @return [Integer]
      def collection_count
        if @pages.size > 0 && @pages[0].metadata && @pages[0].metadata[:count]
          @pages[0].metadata[:count].to_i
        else
          0
        end
      end

      # Iterate over results list
      # @api public
      # @return [nil]
      # @example
      #   results = Clever::District.find # returns a ResultsList
      #   results.each do |district|
      #     puts district.name
      #   end
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
