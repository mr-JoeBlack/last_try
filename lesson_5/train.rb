class Train
  attr_reader :number, :speed, :wagons, :route, :station, :type

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
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

  def del_wagon(wagon)
    wagons.delete(wagon) if stopped? && wagons.include?(wagon)
  end

  def set_route(route)
    self.route = route

    station = route.stations.first

    station.receive_train
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

  protected

  attr_writer :speed, :wagons_count, :route, :station
end
