require './lib/oystercard.rb'
require './lib/station.rb'

p oc = Oystercard.new
p oc.in_journey?
p s = Station.new
p oc.in_journey?
p oc.top_up(5)
#p oc.touch_in(s)
p oc.in_journey?
