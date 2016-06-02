require 'indifference/hash_keys'

module Assignment
  module Attributes

    # Allows you to set all the attributes by passing in a hash of attributes with
    # keys matching the attribute names.
    #
    #   class Cat
    #     include Assignment::Attributes
    #     attr_accessor :name, :status
    #   end
    #
    #   cat = Cat.new
    #   cat.assign_attributes(name: "Gorby", status: "yawning")
    #   cat.name # => 'Gorby'
    #   cat.status => 'yawning'
    #   cat.assign_attributes(status: "sleeping")
    #   cat.name # => 'Gorby'
    #   cat.status => 'sleeping'
    def assign_attributes(new_attributes)
      if !new_attributes.respond_to?(:stringify_keys)
        raise ArgumentError, "When assigning attributes, you must pass a hash as an argument."
      end
      return if new_attributes.nil? || new_attributes.empty?

      attributes = new_attributes.stringify_keys
      _assign_attributes(attributes)
    end

    private

    def _assign_attributes(attributes)
      attributes.each do |k, v|
        _assign_attribute(k, v)
      end
    end

    def _assign_attribute(k, v)
      if respond_to?("#{k}=")
        public_send("#{k}=", v)
      else
        raise UnknownAttributeError.new(self, k)
      end
    end
  end

  class UnknownAttributeError < NoMethodError

    attr_reader :record, :attribute

    def initialize(record, attribute)
      @record = record
      @attribute = attribute.to_s
      super("unknown attribute '#{attribute}' for #{@record.class}.")
    end

  end
end
