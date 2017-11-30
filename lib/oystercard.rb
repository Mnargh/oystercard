require './lib/station.rb'
class Oystercard
  attr_accessor :balance, :in_journey, :entry_station, :journeys_list

  MAX = 90.to_f
  MIN_FOR_JOURNEY = 1.to_f

  def initialize
    @balance = 0.to_f
    @journeys_list = []
  end

  def top_up(money)
    raise("The maximum balance of #{Oystercard::MAX} has been reached") if balance_full?
    @balance += money
  end

  def touch_in(entry_station)
    raise("Insufficient balance for a single journey (#{Oystercard::MIN_FOR_JOURNEY})") if insufficient_funds?
    # @j = Journey.new
    # @j.
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FOR_JOURNEY)
    # @j.finish(exit_station)
    @journeys_list << {entry_station: @entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private
  def deduct(money)
    @balance -= money
  end

  def insufficient_funds?
    @balance < MIN_FOR_JOURNEY
  end

  def balance_full?(amount)
    @balance + money > MAX
  end
end
