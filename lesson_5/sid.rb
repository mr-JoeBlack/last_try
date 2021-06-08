require_relative 'main'

train1 = PassengerTrain.new("1")
train2 = CargoTrain.new("2")
train3 = CargoTrain.new("3")

station = Station.new("Новочеркасск")
station.receive_train(train1)
station.receive_train(train2)
station.receive_train(train3)

station.trains_list

station.trains_list_by_type("CargoTrain")
station.trains_list_by_type("PassengerTrain")
