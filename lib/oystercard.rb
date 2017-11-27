class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
    @max_limit = 90
  end

  def top_up(money)
    raise("The maximum balance has been reached") if @balance + money > @max_limit
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

end
