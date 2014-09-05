module Clever
  # An instance of an APIResource's contents
  class CleverObject
    include Enumerable

    # TODO: fix this
    # rubocop:disable ClassVars
    @@permanent_attributes = Set.new []

    # The default :id method is deprecated and isn't useful to us
    undef :id if method_defined? :id

    def initialize(id = nil)
      @values = {}
      @values[:id] = id if id
    end

    def self.construct_from(values)
      obj = new values[:id]
      obj.refresh_from values
      obj
    end

    def to_s
      Clever::JSON.dump @values, pretty: true
    end

    def inspect
      id_string = (respond_to?(:id) && !id.nil?) ? " id=#{id}" : ''
      "#<#{self.class}:0x#{object_id.to_s(16)}#{id_string}> JSON: " +
        Clever::JSON.dump(@values, pretty: true)
    end

    def refresh_from(values, partial = false)
      removed = partial ? Set.new : Set.new(@values.keys - values.keys)
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

    def [](k)
      k = k.to_sym if k.is_a? String
      @values[k]
    end

    def []=(k, v)
      send :"#{k}=", v
    end

    def keys
      @values.keys
    end

    def values
      @values.values
    end

    def to_json
      Clever::JSON.dump @values
    end

    def as_json(*a)
      @values.as_json(*a)
    end

    def to_hash
      @values
    end

    def each(&blk)
      @values.each(&blk)
    end

    def ==(other)
      values == other.values if other.respond_to? :values
    end

    protected

    def metaclass
      class << self; self; end
    end

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

    def add_accessors(keys)
      metaclass.instance_eval do
        keys.each do |k|
          next if @@permanent_attributes.include? k
          k_eq = :"#{k}="
          define_method(k) { @values[k] }
          define_method(k_eq) { |v| @values[k] = v }
        end
      end
    end

    def optional_attributes
      fail NotImplementedError 'Please define #optional_attributes as a list of the '\
        'attributes on this resource that may not be present and thus should return nil' \
        'instead of raising a NoMethodError.'
    end

    def method_missing(name, *args)
      return @values[name] if @values.key? name
      return nil if optional_attributes.include? name
      super
    end
  end
end
