require 'oystercard'
describe Oystercard do

  let (:card) { Oystercard.new }
 # This test is used in conjunction with ATTR_ACCESSOR to read the value of the vairable @balance. It checks the default value equals what we expect
  it 'has a starting balance of 0' do
    expect(subject.balance).to eq(0)
  end
end
