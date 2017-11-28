require './lib/oystercard.rb'
require './lib/station.rb'

p oc = Oystercard.new
p oc.in_journey?
p s = Station.new("Euston", 1)
