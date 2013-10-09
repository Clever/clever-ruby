module Clever
  module APIOperations
    module List
      module ClassMethods
        def all(filters={})
          Clever::APIOperations::PageList.new(url, filters).collect{|page| page.all }
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
