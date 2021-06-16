class Train
  attr_reader :number, :speed, :wagons, :route, :station, :type

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
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
    wagons << wagon if stopped? && wagon.type == self.type
  end

  def delete_wagon(wagon)
    wagons.delete(wagon) if stopped? && wagons.include?(wagon)
  end

  def set_route(route)
    self.route = route

    self.station = route.stations.first

    self.station.receive_train(self)
  end

  def previous_station
    route.stations[route.stations.index(station) - 1]
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def forward
    self.station.send_train(self)

    self.station = next_station

    self.station.receive_train(self)
  end

  def backward
    self.station.send_train(self)

    self.station = previous_station

    self.station.receive_train(self)
  end

  protected

  attr_writer :speed, :route, :station
end
