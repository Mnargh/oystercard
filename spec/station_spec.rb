require './lib/station.rb'

describe Station do
  context "initialize" do
     it "Station should initialize with name as first argument" do
      s1 = Station.new("Euston", 1)
      expect(s1.name).to eq "Euston"
     end

     it "Station should initialize with zone as second argument" do
      s1 = Station.new("Euston", 1)
      expect(s1.zone).to eq 1
     end
   end
end
