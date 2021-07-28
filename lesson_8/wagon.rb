require_relative 'manufacturer'
require_relative 'validation'

class Wagon
  include Manufacturer
  include Validation

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

  protected

  def validate!
    raise 'Номер не должен быть пустым' if number.nil? || number.empty?
  end

  private

  attr_writer :capacity_available
end
