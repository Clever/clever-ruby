module Clever
  module APIOperations
    module List
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
