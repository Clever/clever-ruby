module Clever
  # Library helper methods
  module Util
    # Check if a given ID is a valid format (MongoDB BSON ObjectID)
    # @api private
    # @param id [String] ID to check
    # @return [Boolean] Whether or not it was valid
    def self.valid_id?(id)
      id.is_a?(String) && !(/^[0-9a-fA-F]{24}$/.match(id).nil?)
    end

    # Replace APIResource objects with their ids in data structures
    # @api private
    # @return [Object] Original data structure with objects replaced by ids
    def self.objects_to_ids(h)
      case h
      when APIResource
        h.id
      when Hash
        res = {}
        h.each { |k, v| res[k] = objects_to_ids v unless v.nil? }
        res
      when Array
        h.map { |v| objects_to_ids v }
      else
        h
      end
    end

    # Convert an object containing data from Clever into a CleverObject
    # @api private
    # @return [CleverObject]
    def self.convert_to_clever_object(resp)
      case resp
      when Array
        resp.map { |i| convert_to_clever_object i }
      when Hash
        # Try converting to a known object class. If none available, fall back to generic
        # APIResource.
        if resp.key? :uri
          uri = resp[:uri]
        else
          uri = resp[:links].select { |l| l[:rel] == 'self' }[0][:uri]
        end

        klass_name = %r{v1.1/([a-z_]+)/\S+$}.match(uri)[1]
        klass = APIResource.named klass_name if klass_name
        klass ||= CleverObject
        klass.construct_from resp[:data]
      else
        resp
      end
    end

    # Check if a file is readable
    # @api private
    # @return [Boolean]
    def self.file_readable(file)
      File.open(file) {}
    rescue
      false
    else
      true
    end

    # URL encode a key
    # @api private
    # @return [String]
    def self.encode_key(key)
      URI.escape key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")
    end

    # Flatten a params hash into an array
    # @api private
    # @return [Array]
    def self.flatten_params(params, parent_key = nil)
      result = []
      params.each do |key, value|
        calculated_key = parent_key ? "#{parent_key}[#{encode_key key}]" : encode_key(key)
        if value.is_a? Hash
          result += flatten_params value, calculated_key
        elsif value.is_a? Array
          result += flatten_params_array value, calculated_key
        else
          result << [calculated_key, value]
        end
      end
      result
    end

    # Flatten a nested params array into a flat array
    # @api private
    # @return [Array]
    def self.flatten_params_array(value, calculated_key)
      result = []
      value.each do |elem|
        if elem.is_a? Hash
          result += flatten_params elem, calculated_key
        elsif elem.is_a? Array
          result += flatten_params_array elem, calculated_key
        else
          result << ["#{calculated_key}[]", elem]
        end
      end
      result
    end
  end
end
