module Clever
  module APIOperations
    # Handles paginated requests.
    class PageList
      include Enumerable

      # Create a new PageList, without making any requests immediately
      # @api private
      # @return [PageList]
      def initialize(uri, filters = {}, headers = {})
        @uri = uri
        @filters = filters
        @headers = headers
      end

      # Iterate through each page, making requests as you iterate
      # @api private
      # @return [nil]
      # @example
      #   pagelist.each do |page|
      #     page.each do |elem|
      #       puts elem
      #     end
      #   end
      def each
        page = Page.new @uri, @filters, @headers
        until page.nil?
          yield page
          page = page.next
        end
      end

      # Convert PageList into a ResultsList for easier iteration
      # @api private
      # @return [Clever::APIOperations::ResultsList]
      # @example
      #   pagelist.to_results_list.each { |elem| puts elem }
      def to_results_list
        Clever::APIOperations::ResultsList.new self
      end
    end
  end
end
