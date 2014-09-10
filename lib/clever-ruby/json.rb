module Clever
  # Helpers for handling JSON responses
  module JSON
    if MultiJson.respond_to? :dump
      # Dump as a JSON string
      # @api private
      # @return [String]
      def self.dump(*args)
        MultiJson.dump(*args)
      end

      # Load a JSON string to an object
      # @api private
      # @return [Object]
      def self.load(*args)
        MultiJson.load(*args, symbolize_keys: true)
      end
    else
      # Dump as a JSON string
      # @api private
      # @return [String]
      def self.dump(*args)
        MultiJson.encode(*args)
      end

      # Load a JSON string to an object
      # @api private
      # @return [Object]
      def self.load(*args)
        MultiJson.decode(*args, symbolize_keys: true)
      end
    end
  end
end
