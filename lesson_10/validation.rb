# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(arg_name, validation_type, arguments = {})
      @validations ||= []
      @validations << { arg_name: arg_name, validation_type: validation_type, arguments: arguments }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        arg_name = instance_variable_get("@#{validation[:arg_name]}")
        send("validate_#{validation[:validation_type]}", arg_name, *validation[:arguments])
      end
    end

    def valid?
      validate!

      true
    rescue RuntimeError
      false
    end

    protected

    def validate_presense(arg_name)
      raise "#{arg_name} не может быть пустым" if arg_name.nil? || arg_name.empty?
    end

    def validate_format(arg_name, format)
      raise "#{arg_name} не соответсвует указанному шаблону" if arg_name !~ format
    end

    def validate_type(arg_name, type)
      raise "#{arg_name} не соотвествует указанному классу #{type}" unless arg_name.is_a?(type)
    end
  end
end
