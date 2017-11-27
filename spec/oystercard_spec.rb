require 'oystercard'

describe Oystercard do
  it "check default balance" do
    expect(subject.balance).to eq(0)
  end

  it "add money" do
    expect{subject.top_up(5)}.to change{subject.balance}.from(0).to(5)
  end

  it "enforce max balance" do
    90.times{subject.top_up(1)}
    expect{ subject.top_up(1) }.to raise_error("The maximum balance has been reached")
  end

  it "deduct money" do
    subject.top_up(20)
    expect{subject.deduct(1)}.to change{subject.balance}.by -1
  end


end
