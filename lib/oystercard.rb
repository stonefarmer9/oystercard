class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_accessor :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

 def top_up(amount)
   max_balance_breach(amount)
   @balance += amount
 end

 def touch_in
   fail "1" if @balance < MINIMUM_FARE
   @in_journey = true
 end

 def touch_out
   deduct(MINIMUM_FARE)
   @in_journey = false
 end

def in_journey
  @in_journey
end

private

def max_balance_breach(amount)
  fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
end

def deduct(amount)
  @balance -= amount
end

def min_balance_breach(amount)

end

end
