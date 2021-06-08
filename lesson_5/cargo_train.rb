class CargoTrain < Train
  def initialize(number, wagons_count = 0)
    super

    @type = :cargo
  end
end
