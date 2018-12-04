require 'oystercard'

describe Oystercard do

  let (:card) { Oystercard.new }
context '#balance' do

  it 'has a starting balance of 0' do
    expect(card.balance).to eq(0)
  end
end

context '#top_up' do
  it 'lets you top up your balance' do
    card.balance = 10
    expect(card.top_up(20)).to eq 30
  end

  it 'raises an error if the max balance is breached' do
    maximum_balance = Oystercard::MAX_BALANCE
    card.top_up(maximum_balance)
    expect{ card.top_up 1 }.to raise_error "#{maximum_balance} limit breached"
  end
end

context '#touch_in' do

  it 'starts not checked in' do
    card.top_up(1)
    card.touch_in
    expect(card.in_journey).to be true
  end

  it 'Lets you touch-in and changes the status of the card' do
    card.top_up(1)
    expect(card.touch_in).to be true
  end

  it 'raises an error' do
    expect { card.touch_in }.to raise_error "1"
  end

end

context "#touch_out" do

  it 'Lets you touch-out and changes the status of the card' do
    expect(card.touch_out).to be false
  end

  it 'Deducts the MINIMUM_FARE from the balance on touch out' do
    expect { card.touch_out }.to change{ card.balance }.by(-Oystercard::MINIMUM_FARE)
  end
 end
end
