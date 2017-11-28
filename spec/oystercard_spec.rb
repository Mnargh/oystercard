require 'oystercard'

describe Oystercard do
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}
  # let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  context "card balance" do
    it "check default balance" do
      expect(subject.balance).to eq(0)
    end

    it "add money" do
      expect{subject.top_up(5)}.to change{subject.balance}.from(0).to(5)
    end

    it "enforce max balance" do
      90.times{subject.top_up(1)}
      expect{ subject.top_up(1) }.to raise_error("The maximum balance of #{Oystercard::MAX} has been reached")
    end
  end

  context "Touch_in" do
    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it "touch in changes in_journey to true" do
      oc = Oystercard.new
      oc.top_up(1)
      oc.touch_in(entry_station)
      expect(oc.in_journey?).to be(true)
    end

    it "touch in below minimum balance returns error" do
      oc = Oystercard.new
      oc.top_up(0.99)
      expect{ oc.touch_in(entry_station) }.to raise_error("Insufficient balance for a single journey (#{Oystercard::MIN_FOR_JOURNEY})")
    end
  end

  context "Touch_out" do
    it "touch out changes in_journey to false" do
      oc = Oystercard.new
      oc.top_up(1)
      oc.touch_in(entry_station)
      oc.touch_out(exit_station)
      expect(oc.in_journey?).to be(false)
    end

    it "should decrease by minimum value when touching out" do
      oc = Oystercard.new
      oc.top_up(5.0)
      oc.touch_in(entry_station)
      expect{ oc.touch_out(exit_station) }.to change{ oc.balance }.by (-(Oystercard::MIN_FOR_JOURNEY))
    end

    it "should save a journey hash after touching out (after completing a journey)" do
      oc = Oystercard.new
      oc.top_up(5)
      oc.touch_in(entry_station)
      oc.touch_out(exit_station)
      expect(oc.journeys_list).to eq([{entry_station => exit_station}])
    end
  end

  context "journey" do
    it "should have an empty array as default for the variable journeys" do
      expect(Oystercard.new.journeys_list).to be_empty
    end

    it "in journey defaults to false" do
      #expect(subject.in_journey?).to be(false)
      expect(Oystercard.new).to_not be_in_journey
    end
  end

  # it "should save a journey hash after touching out (after completing a journey)" do
  #   oc = Oystercard.new
  #   oc.top_up(5)
  #   oc.touch_in(entry_station)
  #   oc.touch_out(exit_station)
  #   expect(oc.journeys_list).to include journey
  # end


end
