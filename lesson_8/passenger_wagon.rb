require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, capacity)
    super

    capacity_validate!

    @type = :passenger
  end

  def take_seat
    raise "Свободных мест нет" if capacity_available.zero?

    self.capacity_available -= 1
  end

  alias seats_taken capacity_taken
  alias seats_available capacity_available

  private

  def capacity_validate!
    raise "Число место должность быть целым числом" unless @capacity.is_a? Integer
  end
end
