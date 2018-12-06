require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_accessor :balance, :journey_history


  def initialize
    @balance = 0
    @journey_history = []
  end

 def top_up(amount)
   max_balance_breach(amount)
   @balance += amount
 end

 def touch_in(journey = Journey.new(entry_station: station))
   fail "1" if @balance < MINIMUM_FARE
   @journey = journey
 end

 def touch_out(exit_station)
   @journey.finish(exit_station)
   @journey_history << [@journey]
   deduct(@journey.fare)
 end

private

def max_balance_breach(amount)
  fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
end

def deduct(amount)
  @balance -= amount
end

end
