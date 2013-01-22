module Clever
  class APIResource < CleverObject
    def self.url
      if self == APIResource
        raise NotImplementedError.new('APIResource is an abstract class.  You should perform actions on its subclasses (School, Student, etc.)')
      end
      shortname = self.name.split('::')[-1]
      "/#{CGI.escape(shortname.downcase)}s"
    end

    def url
      unless id = self['id']
        raise InvalidRequestError.new("Could not determine which URL to request: #{self.class} instance has invalid ID: #{id.inspect}", 'id')
      end
      "#{self.class.url}/#{CGI.escape(id)}"
    end

    def refresh
      response, api_key = Clever.request(:get, url, @api_key)
      refresh_from(response[:data], api_key)
      self
    end

    def self.retrieve(id, api_key=nil)
      instance = self.new(id, api_key)
      instance.refresh
      instance
    end
  end
end
