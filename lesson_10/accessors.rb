module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      define_method(name) { instance_variable_get("@#{name}".to_sym) }

      define_method("#{name}=".to_sym) do |value|
        current_value = instance_variable_get("@#{name}".to_sym)
        history = instance_variable_get("@#{name}_history")

        history.nil? ? instance_variable_set("@#{name}_history".to_sym, []) : history << current_value

        instance_variable_set("@#{name}".to_sym, value)
      end

      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history") }
    end
  end

  def strong_attr_accessor(name, type)
    define_method(name) { instance_variable_get("@#{name}".to_sym) }

    define_method("#{name}=".to_sym) do |value|
      raise ArgumentError, "Класс значения #{value} не совпадает с #{type}" until value.is_a?(type)
    end
  end
end
