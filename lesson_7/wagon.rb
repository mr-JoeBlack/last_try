require_relative 'manufacturer'
require_relative 'validation'

class Wagon
  include Manufacturer
  include Validation

  attr_reader :number, :type

  def initialize(number)
    @number = number

    validate!
  end

  protected

  def validate!
    raise 'Номер не должен быть пустым' if number.nil? || number.empty?
  end
end
