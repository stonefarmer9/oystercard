require 'station'

describe Station do
  let (:station) { Station.new('Coley', 1) }

  it 'has a zone value' do
  expect(station.zone).to eq 1
end

  it 'has a name' do
    expect(station.name).to eq 'Coley'
  end
end
