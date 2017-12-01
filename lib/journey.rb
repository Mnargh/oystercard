class Journey
  attr_accessor :entry_station, :exit_station
  DEFAULT_JOURNEY_FARE = 1
  PENALTY_FARE = 15

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    self.complete? ? DEFAULT_JOURNEY_FARE : PENALTY_FARE
  end

  def complete?
    !!(@entry_station && @exit_station)
  end


end
