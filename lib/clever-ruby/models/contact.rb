=begin
#Clever API

#The Clever API

OpenAPI spec version: 2.1.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.18

=end

require 'date'

module Clever
  class Contact
    attr_accessor :district

    attr_accessor :email

    attr_accessor :id

    attr_accessor :name

    attr_accessor :phone

    attr_accessor :phone_type

    attr_accessor :relationship

    attr_accessor :sis_id

    attr_accessor :students

    attr_accessor :type

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'district' => :'district',
        :'email' => :'email',
        :'id' => :'id',
        :'name' => :'name',
        :'phone' => :'phone',
        :'phone_type' => :'phone_type',
        :'relationship' => :'relationship',
        :'sis_id' => :'sis_id',
        :'students' => :'students',
        :'type' => :'type'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'district' => :'String',
        :'email' => :'String',
        :'id' => :'String',
        :'name' => :'String',
        :'phone' => :'String',
        :'phone_type' => :'String',
        :'relationship' => :'String',
        :'sis_id' => :'String',
        :'students' => :'Array<String>',
        :'type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'district')
        self.district = attributes[:'district']
      end

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'phone')
        self.phone = attributes[:'phone']
      end

      if attributes.has_key?(:'phone_type')
        self.phone_type = attributes[:'phone_type']
      end

      if attributes.has_key?(:'relationship')
        self.relationship = attributes[:'relationship']
      end

      if attributes.has_key?(:'sis_id')
        self.sis_id = attributes[:'sis_id']
      end

      if attributes.has_key?(:'students')
        if (value = attributes[:'students']).is_a?(Array)
          self.students = value
        end
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      phone_type_validator = EnumAttributeValidator.new('String', ['Cell', 'Home', 'Work', 'Other', ''])
      return false unless phone_type_validator.valid?(@phone_type)
      relationship_validator = EnumAttributeValidator.new('String', ['Parent', 'Grandparent', 'Self', 'Aunt/Uncle', 'Sibling', 'Other', ''])
      return false unless relationship_validator.valid?(@relationship)
      type_validator = EnumAttributeValidator.new('String', ['Parent/Guardian', 'Emergency', 'Primary', 'Secondary', 'Family', 'Other', ''])
      return false unless type_validator.valid?(@type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] phone_type Object to be assigned
    def phone_type=(phone_type)
      validator = EnumAttributeValidator.new('String', ['Cell', 'Home', 'Work', 'Other', ''])
      unless validator.valid?(phone_type)
        fail ArgumentError, 'invalid value for "phone_type", must be one of #{validator.allowable_values}.'
      end
      @phone_type = phone_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] relationship Object to be assigned
    def relationship=(relationship)
      validator = EnumAttributeValidator.new('String', ['Parent', 'Grandparent', 'Self', 'Aunt/Uncle', 'Sibling', 'Other', ''])
      unless validator.valid?(relationship)
        fail ArgumentError, 'invalid value for "relationship", must be one of #{validator.allowable_values}.'
      end
      @relationship = relationship
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ['Parent/Guardian', 'Emergency', 'Primary', 'Secondary', 'Family', 'Other', ''])
      unless validator.valid?(type)
        fail ArgumentError, 'invalid value for "type", must be one of #{validator.allowable_values}.'
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          district == o.district &&
          email == o.email &&
          id == o.id &&
          name == o.name &&
          phone == o.phone &&
          phone_type == o.phone_type &&
          relationship == o.relationship &&
          sis_id == o.sis_id &&
          students == o.students &&
          type == o.type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [district, email, id, name, phone, phone_type, relationship, sis_id, students, type].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = Clever.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
