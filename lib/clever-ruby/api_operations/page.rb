module Clever
  module APIOperations
    class Page
      attr_accessor :paging
      def initialize(uri, filters={}, headers={})
        @uri = uri
        @filters = filters
        @headers = headers

        response = Clever.request(:get, uri, filters, @headers)
        @list = Util.convert_to_clever_object(response[:data])
        self.paging = response[:paging]
      end

      def all
        @list
      end
    end
  end
end
