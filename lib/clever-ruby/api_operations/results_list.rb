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
