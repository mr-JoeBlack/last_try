require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(number, capacity)
    super

    capacity_validate!

    @type = :cargo
  end

  def take_capacity(capacity)
    raise "Недостаточно свободного места" if capacity > capacity_available

    self.capacity_available -= capacity
  end

  protected

  def capacity_validate!
    raise "Объем должен быть числом" unless capacity.is_a? Numeric
  end
end