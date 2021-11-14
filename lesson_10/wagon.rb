# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'validation'

class Wagon
  include Manufacturer
  include Validation

  validate(:number, :presense)

  attr_reader :number, :type, :capacity, :capacity_available

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @capacity_available = capacity

    validate!
  end

  def capacity_taken
    capacity - capacity_available
  end

  private

  attr_writer :capacity_available
end
