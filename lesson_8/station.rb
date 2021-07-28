require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  @@stations = []

  def self.all
    @@stations
  end

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []

    validate!

    @@stations << self

    register_instance
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

  def each_train
    trains.each { |train| yield train }
  end

  private

  def validate!
    raise 'Название не может быть пустым' if name.nil? || name.empty?
  end
end
