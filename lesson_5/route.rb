class Route
  attr_reader :stations, :name

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @name = "#{first_station.name} - #{last_station.name}"
  end

  def add_station(station)
    stations.insert( -2, station )
  end

  def remove_station(station)
    stations.delete(station) if stations.include?(station)
  end

  def stations_list
    stations.each_with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end
end
