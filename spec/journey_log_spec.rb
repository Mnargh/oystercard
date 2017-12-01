require 'journey'
require 'oystercard'
require 'station'
require 'journey_log'

describe JourneyLog do
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}
  let(:blank_journey) {double(:blank_journey, entry_station: nil, exit_station: nil)}
  let(:started_journey) {double(:started_journey, entry_station: entry_station, exit_station: nil)}
  let(:journey_class) {double(:journey_class, new: blank_journey)}
  let(:jl) { JourneyLog.new(journey_class) }
  let(:complete_journey) {double(:complete_journey, entry_station: entry_station, exit_station: exit_station)}



  context "Starting a journey" do

    it "Starts a new journey" do
      expect(journey_class).to receive(:new).with(entry_station)
      jl.start(entry_station)
    end

    it "Records a new journey" do
      allow(journey_class).to receive(:new).with(entry_station).and_return started_journey
      jl.start(entry_station)
      expect(jl.journeys).to include started_journey

    end
  end

  context "Finishing a journey" do
    it "Finishes a journey by adding an exit station to the current_journey" do
      p jl.start(entry_station)
      p jl.finish(exit_station)
      expect(jl.current_journey).to be_complete
    end
  end
end
