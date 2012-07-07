module Clever
  class CleverObject
    include Enumerable

    attr_accessor :api_key
    @@permanent_attributes = Set.new([:api_key])

    # The default :id method is deprecated and isn't useful to us
    if method_defined?(:id)
      undef :id
    end

    def initialize(id=nil, api_key=nil)
      @api_key = api_key
      @values = {}
      @values[:id] = id if id
    end

    def self.construct_from(values, api_key=nil)
      obj = self.new(values[:id], api_key)
      obj.refresh_from(values, api_key)
      obj
    end

    def to_s(*args)
      Clever::JSON.dump(@values, :pretty => true)
    end

    def inspect()
      id_string = (self.respond_to?(:id) && !self.id.nil?) ? " id=#{self.id}" : ""
      "#<#{self.class}:0x#{self.object_id.to_s(16)}#{id_string}> JSON: " + Clever::JSON.dump(@values, :pretty => true)
    end

    def refresh_from(values, api_key, partial=false)
      @api_key = api_key

      removed = partial ? Set.new : Set.new(@values.keys - values.keys)
      added = Set.new(values.keys - @values.keys)

      instance_eval do
        remove_accessors(removed)
        add_accessors(added)
      end
      removed.each do |k|
        @values.delete(k)
      end
      values.each do |k, v|
        # Stripe apparently allows you to have nested object types (e.g.
        # InvoiceList of Charges). We don't and this was breaking our code
        # @values[k] = Util.convert_to_clever_object(v, api_key)
        @values[k] = v
      end
    end

    def [](k)
      k = k.to_sym if k.kind_of?(String)
      @values[k]
    end

    def []=(k, v)
      send(:"#{k}=", v)
    end

    def keys
      @values.keys
    end

    def values
      @values.values
    end

    def to_json(*a)
      Clever::JSON.dump(@values)
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

    def ==( other )
      if other.respond_to?( :values )
        self.values == other.values
      end
    end

    protected

    def metaclass
      class << self; self; end
    end

    def remove_accessors(keys)
      metaclass.instance_eval do
        keys.each do |k|
          next if @@permanent_attributes.include?(k)
          k_eq = :"#{k}="
          remove_method(k) if method_defined?(k)
          remove_method(k_eq) if method_defined?(k_eq)
        end
      end
    end

    def add_accessors(keys)
      metaclass.instance_eval do
        keys.each do |k|
          next if @@permanent_attributes.include?(k)
          k_eq = :"#{k}="
          define_method(k) { @values[k] }
          define_method(k_eq) do |v|
            @values[k] = v
          end
        end
      end
    end

    def method_missing(name, *args)
      return @values[name] if @values.has_key?(name)
      super
    end
  end
end
