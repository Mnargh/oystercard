require './lib/oystercard.rb'
require './lib/station.rb'

p oc = Oystercard.new
p oc.top_up(90)
p s1 = Station.new("Euston", 1)
p s2 = Station.new("Wimbledon", 3)
p oc.touch_in(s1)
p oc.touch_out(s2)
