class Oystercard

  attr_accessor :balance, :in_journey

  def initialize
    @balance = 0
    @max_limit = 90
    @in_journey = false
  end

  def top_up(money)
    raise("The maximum balance has been reached") if @balance + money > @max_limit
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
   @in_journey = true
 end

def touch_out
  @in_journey = false
end


end
