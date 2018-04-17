class Bus

  def initialize(route, destination)
    @route, @destination = route, destination
    @passenger = []
  end

  def drive
    return "Brum brum"
  end

  def passenger_count
    return @passenger.count
  end

  def pick_up(passenger)
    @passenger << passenger
  end

  def drop_off(passenger)
    @passenger.delete(passenger)
  end

  def empty!
    @passenger.clear
  end

  def pick_up_from_stop stop
    stop.queue.each{ |person|
      if person.destination == @destination
        @passenger << person
        stop.remove_person(person)
      end
    }
  end
end
