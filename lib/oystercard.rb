class Oystercard

  MAX_BALANCE = 90

  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

 def top_up(amount)
   max_balance_breach(amount)
  # fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
   @balance += amount
 end

 def deduct(amount)
   @balance -= amount
 end

private

def max_balance_breach(amount)
  fail "#{MAX_BALANCE} limit breached" if amount + @balance > MAX_BALANCE
end


end
