require './lib/oystercard.rb'

p oc = Oystercard.new
p oc.top_up(5)
p oc.touch_in
p oc.touch_out
p oc.balance
