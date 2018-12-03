require 'oystercard'
describe Oystercard do

  let (:card) { Oystercard.new }

  it 'has a starting balance of 0' do
    expect(card.balance).to eq(0)
  end
#This test tests that a card with a default of 0, is then changed to 10 and then tests whether the output of the top_up method equals our expected mathmatical answer
  it 'lets you top up your balance' do
    card.balance = 10
    expect(card.top_up(20)).to eq 30
  end
end
