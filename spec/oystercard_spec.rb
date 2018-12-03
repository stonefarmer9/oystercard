require 'oystercard'
describe Oystercard do

  #let (:card) { Oystercard.new }

  it 'has a starting balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end
end
