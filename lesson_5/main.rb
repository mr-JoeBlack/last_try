=begin
Добавить текстовый интерфейс:

Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
     - Создавать станции
     - Создавать поезда
     - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     - Назначать маршрут поезду
     - Добавлять вагоны к поезду
     - Отцеплять вагоны от поезда
     - Перемещать поезд по маршруту вперед и назад
     - Просматривать список станций и список поездов на станции
=end

require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railway_management'

railway = RailwayManagement.new

railway.options_list

loop do
  puts "Выберите пункт меню:"

  case gets.chomp.to_i

  when 0
    break
  when 1
    railway.create_station
  when 2
    railway.create_train
  end
end
