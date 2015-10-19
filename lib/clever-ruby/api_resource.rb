module Clever
  # Superclass of API resources in the Clever API. API objects are to be
  # singular, not plural; as in class Student, for the /students endpoint.
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

      # Get the plural form of a resource's name
      #
      # For instance, for class Student, returns "students"
      # @api private
      # @return [String] Plural name of a resource
      attr_reader :plural

      # Get the URI corresponding to a resource
      #
      # For instance, for class Student, urls start with /v1.1/students, so
      # this returns "students"
      # @api private
      # @return [String] URI corresponding to a resource
      attr_reader :uri

      # Get the event name corresponding to a resource
      #
      # For some events, event type names have an inconsistent format with plurals and URIs.
      # For example, SchoolAdmin events are "schooladmins"
      # @api private
      # @return [String] event type name of a resource
      attr_reader :event_name
    end

    # Registers valid API resources
    # @api private
    # @return [Object]
    def self.inherited(child_class)
      @resources << child_class
      super
    end

    # Check if the name of an APIResource is in its singular form
    #
    # For instance, the Student API resource can be referred to as
    # "student" or "students"; this returns true on the former.
    # @api private
    # @param word [String] APIResource name to check
    # @return [Boolean] False if plural, true if singular
    def self.singular?(resource_name)
      klass = named resource_name
      unless klass
        fail 'Clever::APIResource only supports checking singularity of words '\
          'that refer to children of Clever::APIResource; received ' \
          "'#{resource_name}'"
      end

      klass.plural != resource_name.downcase
    end

    # Get a canonical name for a resource
    # @api private
    # @return [String]
    def self.shortname
      name.split('::')[-1].gsub(/([a-z\d])([A-Z])/, '\1_\2'.freeze).downcase
    end

    # Convert the uri of a resource to its APIResource subclass
    # @api private
    # @return [APIResource]
    def self.named(name)
      name = name.to_s.downcase
      matching = resources.select do |res|
        (name == res.shortname) || (name == res.plural) || (name == res.event_name)
      end
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
      "v1.1/#{uri}"
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
        if APIResource.singular? resource.to_s
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
