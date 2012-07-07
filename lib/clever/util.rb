module Clever
  module Util
    def self.objects_to_ids(h)
      case h
      when APIResource
        h.id
      when Hash
        res = {}
        h.each { |k, v| res[k] = objects_to_ids(v) unless v.nil? }
        res
      when Array
        h.map { |v| objects_to_ids(v) }
      else
        h
      end
    end

    def self.convert_to_clever_object(resp, api_key)
      types = {
      }
      case resp
      when Array
        resp.map { |i| convert_to_clever_object(i, api_key) }
      when Hash
        # Try converting to a known object class.  If none available, fall back to generic APIResource
        if klass_name = resp[:object]
          klass = types[klass_name]
        end
        klass ||= CleverObject
        klass.construct_from(resp, api_key)
      else
        resp
      end
    end
  end
end