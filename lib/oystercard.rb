class Oystercard
  attr_accessor :balance, :in_journey, :entry_station

  MAX = 90.to_f
  MIN_FOR_JOURNEY = 1.to_f

  def initialize
    @balance = 0.to_f
    @entry_station = nil
  end

  def top_up(money)
    raise("The maximum balance of #{Oystercard::MAX} has been reached") if @balance + money > MAX
    @balance += money
  end

  def touch_in(station)
    raise("Insufficient balance for a single journey (#{Oystercard::MIN_FOR_JOURNEY})") if @balance < MIN_FOR_JOURNEY
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FOR_JOURNEY)
    @entry_station = nil
  end

  def in_journey?
    @entry_station == nil ? false : true
  end

  private
  def deduct(money)
    @balance -= money
  end


end
