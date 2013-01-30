module Clever
  module APIOperations
    module List
      module ClassMethods
        def all(filters={})
          response = Clever.request(:get, url, filters)
          Util.convert_to_clever_object(response[:data])
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
