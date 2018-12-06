class Journey

  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false
  end

  def finish(exit_station = nil)
    @exit_station = exit_station
    @complete = true
    self
  end

  def complete?
    @complete
  end

  def fare
    complete? ? 1 : 6
  end
end
