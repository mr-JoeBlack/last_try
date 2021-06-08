class RailwayManagement
  attr_reader :options

  def initialize
    @options = [
      "0 - Завершить и выйти",
      "1 - Создать станцию",
      "2 - Создать поезд"
    ]
  end

  def options_list
    options.each { |option| puts option }
  end

  def create_station

  end

  def create_train

  end
end