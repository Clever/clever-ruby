module Clever
  class APIResource < CleverObject
    def self.url
      if self == APIResource
        raise NotImplementedError.new('APIResource is an abstract class.  You should perform actions on its subclasses (School, Student, etc.)')
      end
      shortname = self.name.split('::')[-1]
      "v1.1/#{CGI.escape(shortname.downcase)}s"
    end

    def url
      unless id = self['id']
        raise InvalidRequestError.new("Could not determine which URL to request: #{self.class} instance has invalid ID: #{id.inspect}", 'id')
      end
      "#{self.class.url}/#{CGI.escape(id)}"
    end

    def refresh
      response = Clever.request(:get, url, nil, headers)
      refresh_from(response[:data])
      self
    end

    def links
      response = Clever.request(:get, url, nil, headers)
      response[:links]
    end

    def self.retrieve(id, auth_token=nil)
      instance = self.new(id, auth_token)
      instance.refresh
      instance
    end
  end
end
