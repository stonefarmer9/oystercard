require 'oystercard'

describe Oystercard do

  let (:card) { Oystercard.new }
  let (:entry_station) { double :station }
  let (:exit_station) { double :station }
  let(:journey_class_double) { double(:journey_class, new: journey_double) }
  let(:journey_double) { double(:journey) }

context '#initialise' do
  it 'starts with no journeys stored' do
    expect(card.journey_history).to be_empty
  end

  it 'starts with 0 balance' do
    expect(card.balance).to eq 0
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
    expect { card.touch_in(entry_station) }.to raise_error "1"
  end

end

context "#touch_out" do


  it 'Deducts the MINIMUM_FARE from the balance on touch out' do
    allow(journey_double).to receive(:finish).and_return(journey_double)
    allow(journey_double).to receive(:fare).and_return(1)
    card.top_up(20)
    card.touch_in(journey_double)
    expect { card.touch_out(exit_station) }.to change{ card.balance }.by(-Oystercard::MINIMUM_FARE)
  end

 end

 context "Saving the journey" do



   it 'Saves the entry and exit stations' do
     allow(journey_double).to receive(:finish).and_return(journey_double)
     allow(journey_double).to receive(:fare).and_return(1)
     card.top_up(20)
     card.touch_in(journey_double)
     card.touch_out(exit_station)
     expect(card.journey_history).to include [journey_double]
   end
   end
 end
