require("minitest/autorun")
require("minitest/rg")
require_relative("../bus_stop")
require_relative("../person")

class BusStopTest < MiniTest::Test
  def setup
    @bus_stop = BusStop.new("George Street")
    @person = Person.new(24, "Daniel", "Ocean Terminal")
    @person2 = Person.new(23, "Hannah", "Gyle")
  end

  def test_get_queue
    assert_equal([], @bus_stop.queue)
  end

  def test_get_queue_length
    assert_equal(0, @bus_stop.queue_length)
  end

  def test_add_person
    @bus_stop.add_person(@person)
    @bus_stop.add_person(@person2)
    assert_equal(2, @bus_stop.queue_length)
  end

  def test_remove_person
    @bus_stop.add_person(@person)
    @bus_stop.add_person(@person2)
    @bus_stop.remove_person(@person2)
    assert_equal(1, @bus_stop.queue_length)
  end

  def test_remove_person__not_at_stop
    @bus_stop.add_person(@person)
    @bus_stop.remove_person(@person2)
    assert_equal(1, @bus_stop.queue_length)
  end
end
