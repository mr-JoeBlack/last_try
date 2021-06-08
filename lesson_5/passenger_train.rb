class PassengerTrain < Train
  def initialize(number, wagon_count = 0)
    super

    @type = :passenger
  end
end
