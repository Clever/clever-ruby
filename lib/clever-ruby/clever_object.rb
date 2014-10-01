module Clever
  # An instance of an APIResource's contents
  class CleverObject              # rubocop: disable ClassLength
    include Enumerable

    # TODO: fix this
    # rubocop:disable ClassVars
    @@permanent_attributes = Set.new []

    # The default :id method is deprecated and isn't useful to us
    undef :id if method_defined? :id

    # Create an instance of CleverObject by id
    # @abstract
    # @api private
    # @param id [String, Hash] id, or values to instantiate from
    # @return [CleverObject] resource instance
    def initialize(id = nil, auth_token = nil)
      @values = {}
      @values[:id] = id if id
      @values[:auth_token] = auth_token if auth_token
    end

    # Construct a CleverObject from the values it should contain. Requires :id
    # @api private
    # @return [CleverObject]
    def self.construct_from(values)
      obj = new values[:id]
      obj.refresh_from values
      obj
    end

    # Convert to a pretty-printed JSON string
    # @api public
    # @return [String] JSON representation of the CleverObject
    # @example
    #   puts obj.to_s
    def to_s
      Clever::JSON.dump @values, pretty: true
    end

    # Convert this object to a detailed human-readable string
    # @api public
    # @return [String] Detailed representation of the CleverObject
    # @example
    #   puts obj.inspect
    def inspect
      id_string = (respond_to?(:id) && !id.nil?) ? " id=#{id}" : ''
      "#<#{self.class}:0x#{object_id.to_s(16)}#{id_string}> JSON: " +
        Clever::JSON.dump(@values, pretty: true)
    end

    # Populate this object with the values passed in
    # @api private
    # @param values [Hash] values to set
    # @param partial [Boolean] whether to replace existing keys or start fresh
    # @return [CleverObject]
    def refresh_from(values, partial = false)
      removed = partial ? Set.new : Set.new(@values.keys - [:auth_token] - values.keys)
      added = Set.new(values.keys - @values.keys)

      instance_eval do
        remove_accessors removed
        add_accessors added
      end
      removed.each do |k|
        @values.delete k
      end
      values.each do |k, v|
        # Stripe apparently allows you to have nested object types (e.g.
        # InvoiceList of Charges). We don't and this was breaking our code
        # @values[k] = Util.convert_to_clever_object(v)
        @values[k] = v
      end
    end

    # Returns the headers needed to authorize subsequent requests
    # @api  private
    # @return [Object] Authorization header with this auth_token
    def headers
      if @values.key? :auth_token
        { Authorization: 'Bearer ' + @values[:auth_token] }
      else
        {}
      end
    end

    # Access a value by key
    # @api public
    # @param k [String, Symbol] Key to access
    # @return [Object] Value at that key
    # @example
    #   district = Clever::District.retrieve id
    #   puts district[:name]
    def [](k)
      k = k.to_sym if k.is_a? String
      @values[k]
    end

    # Set an attribute
    # @api public
    # @param k [String, Symbol] Key to set
    # @param v [Object] Value to set
    # @return [Object]
    # @example
    #   district = Clever::District.retrieve id
    #   district[:name] = "New district name"
    def []=(k, v)
      send :"#{k}=", v
    end

    # Get list of keys in object
    # @api public
    # @return [Array] list of keys
    # @example
    #   district = Clever::District.retrieve id
    #   puts district.keys
    def keys
      @values.keys
    end

    # Get list of values in object
    # @api public
    # @return [Array] list of values
    # @example
    #   district = Clever::District.retrieve id
    #   puts district.values
    def values
      @values.values
    end

    # Convert to a JSON string
    # @api public
    # @return [String] JSON representation of the CleverObject
    # @example
    #   district = Clever::District.retrieve id
    #   puts district.to_json
    def to_json
      Clever::JSON.dump @values
    end

    # Unsure
    # @todo Figure out what this is intended for and how it should behave
    # @api private
    # @return [Object]
    def as_json(*a)
      @values.as_json(*a)
    end

    # Convert to a Hash
    # @api public
    # @return [Hash] Hash representation of the CleverObject
    # @example
    #   district = Clever::District.retrieve id
    #   data = district.to_hash
    def to_hash
      @values
    end

    # Iterate over key-value pairs in the Object
    # @api public
    # @return [Hash] Values in the object
    # @example
    #   district = Clever::District.retrieve id
    #   district.each do |k, v|
    #     puts "#{k}: #{v}"
    #   end
    def each(&blk)
      @values.each(&blk)
    end

    # Compare two CleverObjects by values
    # @api public
    # @param other [CleverObject] Object to compare
    # @return [Boolean] equality
    # @example
    #   districtOne = Clever::District.retrieve id
    #   districtTwo = Clever::District.retrieve id
    #   districtOne == districtTwo  #=> true
    def ==(other)
      values == other.values if other.respond_to? :values
    end

    protected

    # Fetch CleverObject's metaclass
    # @api private
    # @return [Object]
    def metaclass
      class << self; self; end
    end

    # Remove accessors
    # @api private
    # @return [Object]
    def remove_accessors(keys)
      metaclass.instance_eval do
        keys.each do |k|
          next if @@permanent_attributes.include? k
          k_eq = :"#{k}="
          remove_method k if method_defined? k
          remove_method k_eq if method_defined? k_eq
        end
      end
    end

    # Add accessors
    # @api private
    # @return [Object]
    def add_accessors(keys)
      obj = self
      metaclass.instance_eval do
        keys.each do |k|
          next if @@permanent_attributes.include? k
          unless obj.class.linked_resources.nil?
            next if obj.class.linked_resources.include? k
          end
          k_eq = :"#{k}="
          define_method(k) { @values[k] }
          define_method(k_eq) { |v| @values[k] = v }
        end
      end
    end

    # Defines attributes that the CleverObject can optionally have
    # @api private
    # @return [Array] List of optional attributes
    def optional_attributes
      fail NotImplementedError 'Please define #optional_attributes as a list of the '\
        'attributes on this resource that may not be present and thus should return nil' \
        'instead of raising a NoMethodError.'
    end

    # Automatically adds methods for accessing keys with dot notation
    # @api private
    # @return [Object]
    # @example
    #   district = Clever::District.retrieve id
    #   district.name = "New district name"
    def method_missing(name, *args)
      return @values[name] if @values.key? name
      return nil if optional_attributes.include? name
      super
    end
  end
end
