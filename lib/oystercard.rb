require './lib/station.rb'
class Oystercard
  attr_accessor :balance, :in_journey, :entry_station, :journeys_list

  MAX = 90.to_f
  MIN_FOR_JOURNEY = 1.to_f

  def initialize
    @balance = 0.to_f
    @entry_station = nil
    @journeys_list = []
  end

  def top_up(money)
    raise("The maximum balance of #{Oystercard::MAX} has been reached") if @balance + money > MAX
    @balance += money
  end

  def touch_in(entry_station)
    raise("Insufficient balance for a single journey (#{Oystercard::MIN_FOR_JOURNEY})") if @balance < MIN_FOR_JOURNEY
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FOR_JOURNEY)
    @journeys_list << {@entry_station => exit_station}
    @entry_station = nil
  end

  def in_journey?
    !! @entry_station
  end

  private
  def deduct(money)
    @balance -= money
  end


end
