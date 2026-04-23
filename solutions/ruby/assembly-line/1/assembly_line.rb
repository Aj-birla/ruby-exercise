class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    return if @speed.zero? || @speed.negative? || @speed > 10
    total_car_production = @speed * 221
    if @speed <= 4
      total_car_production
    elsif @speed <= 8
      total_car_production * 0.9
    elsif @speed == 9
      total_car_production * 0.8
    else
      total_car_production * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
