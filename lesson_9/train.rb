require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  attr_reader :number, :speed, :wagons, :route, :station, :type

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0

    validate!

    @@trains[number] = self

    register_instance
  end

  def wagons_list
    wagons.each.with_index(1) { |wagon, index| puts "#{index} - #{wagon.number}" }
  end

  def increase_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def stopped?
    speed.zero?
  end

  def add_wagon(wagon)
    wagons << wagon if stopped? && wagon.type == type
  end

  def delete_wagon(wagon)
    wagons.delete(wagon) if stopped? && wagons.include?(wagon)
  end

  def set_route(route)
    self.route = route

    self.station = route.stations.first

    station.receive_train(self)
  end

  def previous_station
    route.stations[route.stations.index(station) - 1]
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def forward
    station.send_train(self)

    self.station = next_station

    station.receive_train(self)
  end

  def backward
    station.send_train(self)

    self.station = previous_station

    station.receive_train(self)
  end

  def each_wagon(&block)
    wagons.each(&block)
  end

  protected

  attr_writer :speed, :route, :station

  def validate!
    raise 'Неверный формат номера' if number !~ NUMBER_FORMAT
  end
end
