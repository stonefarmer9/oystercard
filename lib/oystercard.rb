class Oystercard

  MAX_BALANCE = 90

  attr_accessor :balance, :in_journey

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

 def top_up(amount)
   max_balance_breach(amount)
  # fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
   @balance += amount
 end

 def deduct(amount)
   @balance -= amount
 end

 def touch_in
   @in_journey = true
 end

 def touch_out
   @in_journey = false

 end

def in_journey
  @in_journey = true
end

private

def max_balance_breach(amount)
  fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
end


end
