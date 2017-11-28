class Oystercard
  attr_accessor :balance, :in_journey
  MAX = 90.to_f
  MIN_FOR_JOURNEY = 1.to_f
  def initialize
    @balance = 0.to_f
    @in_journey = false
  end

  def top_up(money)
    raise("The maximum balance of #{Oystercard::MAX} has been reached") if @balance + money > MAX
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    raise("Card balance is below the minimum required for a single journey (#{Oystercard::MIN_FOR_JOURNEY})") if @balance < MIN_FOR_JOURNEY
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


end
