module Clever
  # Superclass of API resources in the Clever API
  class APIResource < CleverObject
    def self.url
      if self == APIResource
        fail NotImplementedError, 'APIResource is an abstract class. You should perform actions '\
          'on its subclasses (School, Student, etc.)'
      end
      shortname = name.split('::')[-1]
      "v1.1/#{CGI.escape shortname.downcase}s"
    end

    def url
      id = self['id']
      unless id
        fail InvalidRequestError.new(
          "Could not determine which URL to request: #{self.class} instance has " \
          "invalid ID: #{id.inspect}", 'id')
      end
      "#{self.class.url}/#{CGI.escape id}"
    end

    def refresh
      response = Clever.request :get, url
      refresh_from response[:data]
      self
    end

    def links
      response = Clever.request :get, url
      response[:links]
    end

    def self.retrieve(id)
      instance = new id
      instance.refresh
      instance
    end

    def get_linked_resources(resource_type, filters = {})
      Util.convert_to_clever_object Clever.request(:get, get_uri(resource_type), filters)[:data]
    end

    class << self; attr_reader :linked_resources; end
    def initialize(id)
      super id

      resources = self.class.linked_resources || []
      resources.each do |resource|
        self.class.send :define_method, resource do |filters = {}|
          get_linked_resources resource.to_s, filters
        end
      end
    end
  end
end
