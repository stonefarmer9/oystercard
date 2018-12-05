class Journey

  attr_reader :PENALTY_FARE, :entry_station, :exit_station, :complete

  PENALTY_FARE = 6
  MINIMUM_FARE =1

  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false
  end

  def exit(exit_station=nil)
    @exit_station = exit_station
    @complete = true
    self
  end

  def complete?
    @complete
  end

  def fare
    if @entry_station == nil && @exit_station != nil
      PENALTY_FARE
    elsif @entry_station !=nil && @exit_station != nil
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end


end
