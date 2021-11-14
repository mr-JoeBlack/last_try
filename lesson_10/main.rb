# frozen_string_literal: true

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
  puts 'Выберите пункт меню:'

  case gets.chomp.to_i

  when 1
    railway.create_station
  when 2
    railway.create_train
  when 3
    railway.route_management
  when 4
    railway.train_set_route
  when 5
    railway.train_add_wagon
  when 6
    railway.train_delete_wagon
  when 7
    railway.move_train
  when 8
    railway.stations_info
  when 9
    railway.train_wagons_list
  when 10
    railway.station_trains_list
  when 11
    railway.fill_capacity
  else
    break
  end
end
