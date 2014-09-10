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

        def find(id = nil, filters = {})
          if id.is_a? Array
            unless id.select { |e| !Clever::Util.valid_id? e }.empty?
              fail ArgumentError, 'Array of IDs must only contain valid ObjectIDs'
            end

            filters[:where] = JSON.dump(_id: { :'$in' => id })
          end

          if id.nil? || id.is_a?(Array)
            Clever::APIOperations::PageList.new(url, filters).to_results_list
          elsif Clever::Util.valid_id? id
            retrieve id
          else
            fail ArgumentError, 'id must be a valid ObjectID, an array of them, or nil.'
          end
        end

        def count(filters = {})
          filters[:count] = true
          response = Clever.request :get, url, filters
          response[:count]
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end
    end
  end
end
