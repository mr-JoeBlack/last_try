class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def receive_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train) if trains.include?(train)
  end

  def trains_list
    puts "Поезда на станции:"

    trains.each { |train| puts "№#{train.number}" }
  end

  def trains_list_by_type(type)
    puts "Поезда на станции типа: #{type}"

    trains.each { |train| puts "№#{train.number}" if train.type == type }
  end
end
