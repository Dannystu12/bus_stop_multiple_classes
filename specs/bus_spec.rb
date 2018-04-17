require("minitest/autorun")
require("minitest/rg")
require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")


class BusTest < MiniTest::Test

  def setup
    @bus = Bus.new(22, "Ocean Terminal")
    @passenger = Person.new(23, "Hannah", "Ocean Terminal")
    @passenger2 = Person.new(25, "Rachel", "Gyle")
    @bus_stop = BusStop.new("George Street")
  end

  def test_drive
    assert_equal("Brum brum", @bus.drive)
  end

  def test_total_passenger
   assert_equal(0, @bus.passenger_count)
  end

  def test_pick_up
    @bus.pick_up(@passenger)
    assert_equal(1, @bus.passenger_count)
  end


  def test_drop_off
    @bus.pick_up(@passenger)
      @bus.drop_off(@passenger)
    assert_equal(0, @bus.passenger_count)
  end

  def test_drop_off__not_on_bus
    @bus.pick_up(@passenger)
    @bus.drop_off(@passenger2)
    assert_equal(1, @bus.passenger_count)
  end

  def test_empty
    @bus.pick_up(@passenger)
    @bus.empty!
    assert_equal(0, @bus.passenger_count)
  end

  def test_pick_up_from_stop
    @bus_stop.add_person(@passenger)
    @bus_stop.add_person(@passenger2)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(1, @bus.passenger_count)
    assert_equal(1, @bus_stop.queue_length)
  end

end
