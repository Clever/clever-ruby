module Clever
  # Superclass of API resources in the Clever API
  class APIResource < CleverObject
    @resources = []

    class << self
      # Get valid API resources
      # @api private
      # @return [Array] List of valid API resource classes
      attr_reader :resources

      # Get a list of nested resources in the Clever API for this resource
      # @api private
      # @return [Array] List of resources nested under this resource
      attr_reader :linked_resources
    end

    # Registers valid API resources
    # @api private
    # @return [Object]
    def self.inherited(child_class)
      @resources << child_class
      super
    end

    # Get a canonical name for a resource
    # @api private
    # @return [String]
    def self.shortname
      name.split('::')[-1].tableize.singularize
    end

    # Convert the name of a resource to its APIResource subclass
    # @api private
    # @return [APIResource]
    def self.named(name)
      name = name.to_s.tableize.singularize
      matching = resources.select { |res| res.shortname == name }
      return nil if matching.empty?
      matching.first
    end

    # Get URL for a resource
    # @api private
    # @return [String] url to query for a resource
    def self.url
      if self == APIResource
        fail NotImplementedError, 'APIResource is an abstract class. You should perform actions '\
          'on its subclasses (School, Student, etc.)'
      end
      "v1.1/#{CGI.escape shortname.pluralize}"
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
      response = Clever.request :get, url, nil, headers
      refresh_from response[:data]

      @links = response[:links].map do
        |link| { :"#{link[:rel]}" => link[:uri] }
      end.reduce({}, :merge)
      self
    end

    # Get hypermedia links for this resource instance
    # @api private
    # @return [Array] list of links for this resource instance
    attr_reader :links

    # Get an instance of a resource
    # @api public
    # @param id [String] ID of the instance to find
    # @return [APIResource] resource instance
    # @example
    #   id = '...'
    #   district = Clever::District.retrieve id
    def self.retrieve(id, auth_token = nil)
      instance = new id, auth_token
      instance.refresh
      instance
    end

    # Get the URI for a hypermedia link
    # @api private
    # @return [String]
    def get_link_uri(resource_type)
      refresh if links.nil?
      links[resource_type.to_sym]
    end

    # Construct an APIResource. Generates methods for nested resources
    # @abstract
    # @api private
    # @return [APIResource]
    def initialize(id, auth_token = nil)
      super id, auth_token
      return if self.class.linked_resources.nil?

      self.class.linked_resources.each do |resource|
        if Clever::Util.singular? resource.to_s
          # Get single resource
          self.class.send :define_method, resource do
            response = Clever.request :get, get_link_uri(resource), {}, headers
            return Util.convert_to_clever_object response
          end
        else
          # Get list of nested resources
          self.class.send :define_method, resource do |filters = {}|
            Clever::NestedResource.new get_link_uri(resource), filters, headers
          end
        end
      end
    end
  end
end
