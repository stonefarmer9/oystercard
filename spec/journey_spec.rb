require 'journey'

describe Journey do

  let (:station) { double :station, name:"Bristol", zone: 1 }
  let (:journey) { Journey.new(entry_station: :station) }
  let(:other_station) { double :other_station }

  it 'is created with an entry station' do
    expect(journey.entry_station).to eq :station
  end

  it "knows if a journey is not complete" do
    expect(journey).not_to be_complete
  end

  it "returns itself when exiting a journey" do
    expect(journey.exit(other_station)).to eq(journey)
  end

  it "Registers a journey as complete on exit" do
    journey.exit(other_station)
    expect(journey.complete).to eq true
  end

  it 'has a penalty fare by default' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

context 'There is no entry or exit station' do

  it 'returns a fine if no entry station is given' do
      journey.exit(station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns a fine is no exit station is given' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end
end
end
