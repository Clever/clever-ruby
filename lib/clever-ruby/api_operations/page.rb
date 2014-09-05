module Clever
  module APIOperations
    # Represents a page of data
    class Page
      attr_accessor :paging
      attr_reader :list
      alias_method :all, :list

      def initialize(uri, filters = {})
        @uri = uri
        @filters = filters

        response = Clever.request :get, uri, filters
        @list = Util.convert_to_clever_object response[:data]
        self.paging = response[:paging]
      end
    end
  end
end
