=begin
Класс Train (Поезд):
Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train
  attr_reader :number, :type
  attr_accessor :speed, :carriages_count, :route, :station

  def initialize(number, type, carriages_count = 0)
    @number = number
    @type = type
    @carriages_count = carriages_count
    @speed = 0
  end

  def increase_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def stopped?
    speed == 0
  end

  def add_carriage
    carriages_count + 1 if stopped?
  end

  def del_carriage
    carriages_count - 1 if stopped? && carriages_count > 0
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
end
