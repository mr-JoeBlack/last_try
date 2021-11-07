# frozen_string_literal: true

module Validation
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    def valid?
      validate!

      true
    rescue RuntimeError
      false
    end
  end
end
