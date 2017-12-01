require './lib/oystercard.rb'
require './lib/station.rb'
require './lib/journey.rb'

# p oc = Oystercard.new
# p oc.top_up(90)
# p s1 = Station.new("Euston", 1)
# p s2 = Station.new("Wimbledon", 3)
# p oc.touch_in(s1)
# p oc.touch_out(s2)
p new_journey = Journey.new("Euston")
p new_journey.complete?
p new_journey.fare
