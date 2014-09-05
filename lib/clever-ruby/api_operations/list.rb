module Clever
  module APIOperations
    # A list of API resource instances
    module List
      # Class methods for those that include List
      module ClassMethods
        def all(filters = {})
          accum = []
          Clever::APIOperations::PageList.new(url, filters).each do |page|
            accum += page.all
          end
          accum
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
