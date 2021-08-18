require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :name

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @name = "#{first_station.name} - #{last_station.name}"

    validate!

    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station) if stations.include?(station)
  end

  def stations_list
    stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  private

  def validate!
    raise 'Аргумент 1 не является станцией!' if first_station.is_a? Station
    raise 'Аргумент 2 не является станцией!' if last_station.is_a? Station
  end
end
