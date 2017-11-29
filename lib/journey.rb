class Journey
  attr_accessor :entry_station, :exit_station
  MIN_JOURNEY_FARE = 2

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    MIN_JOURNEY_FARE
  end

  def complete?
    (@entry_station != nil && @exit_station != nil) ? true : false
  end











end
