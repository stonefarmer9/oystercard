require 'oystercard'

describe Oystercard do

  let (:card) { Oystercard.new }
  let (:station) { double :station }



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

  it 'raises an error' do
    expect { card.touch_in(station) }.to raise_error "1"
  end

  it 'Saves the entry station' do
    card.top_up(20)
    card.touch_in(station)
    expect(card.entry_station).to eq station
  end

end

context "#touch_out" do


  it 'Deducts the MINIMUM_FARE from the balance on touch out' do
    expect { card.touch_out }.to change{ card.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  it 'Touches out and deletes the entry station' do
    card.top_up(20)
    card.touch_in(station)
    card.touch_out
    expect(card.entry_station).to eq nil
  end

 end
end
