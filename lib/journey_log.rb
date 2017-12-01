# responsible for starting a journey
# ending a journey
# returning a list of journeys
require 'journey'

class JourneyLog
attr_accessor :journey_class, :current_journey, :journeys
  def initialize(journey_class = Journey)
    # @journey_class initializes the Journey class but does not create a new instance
    @journey_class = journey_class
    @current_journey = nil
    @journeys = []
  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
    @journeys << @current_journey
    fare
  end

  def finish(exit_station)
    current_journey.finish(exit_station)
    @current_journey = nil
    fare
  end

  def fare

  end

  private

  def current_journey
    @current_journey ||= @journey_class.new
  end

end
