require 'oystercard'
describe Oystercard do

  let (:card) { Oystercard.new }

  it 'has a starting balance of 0' do
    expect(card.balance).to eq(0)
  end

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
