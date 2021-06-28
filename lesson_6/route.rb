require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations, :name

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @name = "#{first_station.name} - #{last_station.name}"

    register_instance
  end

  def add_station(station)
    stations.insert( -2, station )
  end

  def remove_station(station)
    stations.delete(station) if stations.include?(station)
  end

  def stations_list
    stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end
end
