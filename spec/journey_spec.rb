require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  let(:oystercard){double(:oystercard, balance: 90, journeys_list: [])}

  context "initializing" do
    it "initializes with entry station as no station as default" do
      new_journey = Journey.new
      expect(new_journey.entry_station).to eq nil
    end

    it "initializes with exit station as no station as default" do
      new_journey = Journey.new
      expect(new_journey.exit_station).to eq nil
    end
  end

  context "starting and finishing journeys" do
    it 'starts a journey by passing single argument to Journey' do
      new_journey = Journey.new("Euston")
      expect(new_journey.entry_station).to eq ("Euston")
    end

    it "finishes a journey" do
      new_journey = Journey.new("Euston", "Haggerston")
      expect(new_journey.finish("Haggerston")).to eq ("Haggerston")
    end
  end

  context "Completing journeys" do
    it "Tests if journey is complete" do
      new_journey = Journey.new("Euston", "Haggerston")
      expect(new_journey).to be_complete
    end

    it 'Tests if journey is incomplete if only has entry station' do
      new_journey = Journey.new(nil, "Haggerston")
      expect(new_journey).not_to be_complete
    end

    it 'Tests if journey is incomplete if only has exit station' do
      new_journey = Journey.new("Euston", nil)
      expect(new_journey).not_to be_complete
    end
  end

  context "Calculating journey fares" do
  # can label arguments so know which one you are passing in when using the method. GOOGLE IT!
    it "If journey is incomplete, charges penalty fare on that journey" do
      new_journey = Journey.new("Euston")
      expect(new_journey.fare).to eq Journey::PENALTY_FARE
    end

    it "Calculates the default fare for a journey" do
      new_journey = Journey.new("Euston", "Haggerston")
      expect(new_journey.fare).to eq Journey::DEFAULT_JOURNEY_FARE
    end
  end 
end
