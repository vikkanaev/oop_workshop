# frozen_string_literal: true

class IceCreamFactory
  PACKAGE = Poro::FoilPackage
  INCREASE_TEMP = 30
  DECREASE_TEMP = 10
  INCREASE_RATE = 1.5
  DECREASE_RATE = 0.5

  def initialize(predicter:)
    @predicter = predicter
  end

  def produce(date:, quantity:)
    batch = []

    temp = @predicter.predict(date:)
    n = current_quantity(temp:, quantity:).to_i
    n.times { batch << PACKAGE.new }

    batch
  end

  private

  def current_quantity(temp:, quantity:)
    if temp > INCREASE_TEMP
      quantity * INCREASE_RATE
    elsif temp < DECREASE_TEMP
      quantity * DECREASE_RATE
    else
      quantity
    end
  end
end
