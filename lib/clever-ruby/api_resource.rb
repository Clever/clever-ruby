module Clever
  # Superclass of API resources in the Clever API
  class APIResource < CleverObject
    # Get URL for a resource
    # @api private
    # @return [String] url to query for a resource
    def self.url
      if self == APIResource
        fail NotImplementedError, 'APIResource is an abstract class. You should perform actions '\
          'on its subclasses (School, Student, etc.)'
      end
      shortname = name.split('::')[-1]
      "v1.1/#{CGI.escape shortname.downcase}s"
    end

    # Get URL for an instance of a resource
    # @api private
    # @return [String] url to query for an instance of a resource
    def url
      id = self['id']
      unless id
        fail InvalidRequestError.new(
          "Could not determine which URL to request: #{self.class} instance has " \
          "invalid ID: #{id.inspect}", 'id')
      end
      "#{self.class.url}/#{CGI.escape id}"
    end

    # Request the current resource data and update this object
    # @api private
    # @return [APIResource] The updated resource instance
    def refresh
      response = Clever.request :get, url
      refresh_from response[:data]
      self
    end

    # Get hypermedia links for this resource instance
    # @api private
    # @return [Array] list of links for this resource instance
    def links
      response = Clever.request :get, url
      response[:links]
    end

    # Get an instance of a resource
    # @api public
    # @param id [String] ID of the instance to find
    # @return [APIResource] resource instance
    # @example
    #   id = '...'
    #   district = Clever::District.retrieve id
    def self.retrieve(id)
      instance = new id
      instance.refresh
      instance
    end

    # Request resource instances by following hypermedia links
    # @api private
    # @return [Array] List of resources found
    def get_linked_resources(resource_type, filters = {})
      Util.convert_to_clever_object Clever.request(:get, get_uri(resource_type), filters)[:data]
    end

    class << self
      # Get a list of nested resources in the Clever API for this resource
      # @api private
      # @return [Array] List of resources nested under this resource
      attr_reader :linked_resources
    end

    # Create an instance of APIResource, defining links to nested resources
    # @api public
    # @param [String] id of object to instantiate
    # @return [APIResoruce] resource instance
    # @example
    #   Clever::District.new '531fabe082d522cds8e22'
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
