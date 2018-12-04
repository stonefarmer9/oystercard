class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_accessor :balance, :in_journey, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

 def top_up(amount)
   max_balance_breach(amount)
   @balance += amount
 end

 def touch_in(station)
   fail "1" if @balance < MINIMUM_FARE
   @entry_station = station
 end

 def touch_out
   deduct(MINIMUM_FARE)
   @entry_station = nil
 end

private

def max_balance_breach(amount)
  fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
end

def deduct(amount)
  @balance -= amount
end

def in_journey?
  !!@entry_station
end
end
