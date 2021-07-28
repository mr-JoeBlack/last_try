class RailwayManagement
  attr_reader :options, :stations, :trains, :routes

  def initialize
    @options = [
      "Завершить и выйти",
      "Создать станцию",
      "Создать поезд",
      "Создать маршрут и управлять станциями в нем",
      "Назначить маршрут поезду",
      "Добавить вагон к поезду",
      "Отцепить вагон от поезда",
      "Переместить поезд по маршруту",
      "Просмотреть список станций и список поездов на станции",
      "Вывести список вагонов поезда",
      "Вывести список поездов на станции",
      "Занять место или объем в вагоне"
    ]

    @stations = []
    @trains = []
    @routes = []
  end

  def options_list
    options.each_with_index { |option, index| puts "#{index} - #{option}" }
  end

  def stations_list
    stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def trains_list
    trains.each.with_index(1) { |train, index| puts "#{index} - #{train.number}" }
  end

  def routes_list
    routes.each.with_index(1) { |route, index| puts "#{index} - #{route.name}" }
  end

  def select_station
    stations_list

    stations[gets.chomp.to_i - 1]
  end

  def select_train
    trains_list

    trains[gets.chomp.to_i - 1]
  end

  def select_route
    routes_list

    routes[gets.chomp.to_i - 1]
  end

  def create_station
    puts "Введите название станции:"

    name = gets.chomp
    stations << Station.new(name)
  end

  def create_train
    puts "Введите номер создаваемого поезда:"

    number = gets.chomp

    begin
      puts "Выберите тип создаваемого поезда: 1 - грузовой, 2 - пассажирский"

      type = gets.chomp.to_i

      raise ArgumentError until (1..2).include?(type)
    rescue ArgumentError
      puts "Ошибка создания поезда: неверно указан тип"

      retry
    end

    if type == 1
      trains << CargoTrain.new(number)
    elsif type == 2
      trains << PassengerTrain.new(number)
    end

    puts "Создан поезд №#{number}"
  rescue RuntimeError => e
    puts "Ошибка создания поезда: #{e.message}"

    retry
  end

  def route_management
    puts "Выберите начальную станцию:"

    first_station = select_station

    puts "Выберите конечную станцию:"

    last_station = select_station

    route = Route.new(first_station, last_station)
    routes << route

    puts "Создан маршрут #{route.name}"

    loop do
      puts "Выберите дальнейшее действие: 1 - добавить станцию, 2 - удалить станцию, 0 - возврат к предыдущему меню"

      case gets.chomp.to_i

      when 0
        break
      when 1
        puts "Выберите добавляемую станцию"

        station = select_station
        route.add_station(station)

        puts "К маршруту #{route.name} добавлена промежуточная станция #{station.name}"
      when 2
        puts "Выберите удаляемую станцию:"

        route.stations_list
        station = route.stations[gets.chomp.to_i - 1]
        route.remove_station(station)
      else
        break
      end
    end
  end

  def train_set_route
    puts "Выберите поезд:"

    train = select_train

    puts "Выберите маршрут:"

    route = select_route

    train.set_route(route)
  end

  def train_add_wagon
    puts "Выберите поезд:"

    train = select_train

    puts "Введите номер вагона:"

    number = gets.chomp

    if train.type == :passenger
      puts "Введите количество мест в вагоне"

      seats = gets.chomp.to_i

      train.add_wagon(PassengerWagon.new(number, seats))
    elsif train.type == :cargo
      puts "Введите объем вагона"

      capacity = gets.chomp.to_f

      train.add_wagon(CargoWagon.new(number, capacity))
    end
  end

  def train_delete_wagon
    puts "Выберите поезд:"

    train = select_train

    puts "Выберите удаляемый вагон:"

    train.wagons_list

    wagon = train.wagons[gets.chomp.to_i - 1]
    train.delete_wagon(wagon)
  end

  def move_train
    train = select_train

    puts "Выберите направление движения: 1 - вперед, 2 - назад"

    direction = gets.chomp.to_i

    if direction == 1
      train.forward
    elsif direction == 2
      train.backward
    end
  end

  def stations_info
    stations_list

    puts "Выберите станцию для просмотра списка поездов на ней:"

    stations[gets.chomp.to_i - 1].trains_list
  end

  def train_wagons_list
    train = select_train

    train.each_wagon do |wagon|
      message  = "Вагон №#{wagon.number}, тип #{wagon.type}, "

      if wagon.type == :passenger
        message += "свободно #{wagon.capacity_available} мест, занято #{wagon.capacity_taken}"
      else
        message += "свободно #{wagon.capacity_available} объема, занято #{wagon.capacity_taken}"
      end

      puts message
    end
  end

  def station_trains_list
    station = select_station

    station.each_train do |train|
      puts "Поезд №#{train.number}, тип #{train.type}, вагонов #{train.wagons.count}"
    end
  end

  def fill_capacity
    train = select_train

    puts "Выберите заполняемый вагон:"

    train.wagons_list

    wagon = train.wagons[gets.chomp.to_i - 1]

    if wagon.type == :passenger
      wagon.take_seat
    else
      puts "Введите заполняемый объем:"

      wagon.take_capacity(gets.chomp.to_f)
    end
  end
end