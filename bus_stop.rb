class BusStop
  attr_reader :queue
  def initialize name
    @name, @queue = name, []
  end

  def queue_length
    @queue.length
  end

  def add_person person
    @queue << person
  end

  def remove_person person
    @queue.delete person
  end
end
