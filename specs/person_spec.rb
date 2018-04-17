require("minitest/autorun")
require("minitest/rg")
require_relative("../person")

class PersonTest < MiniTest::Test
  def setup
    @person = Person.new(22, "Daniel", "Ocean Terminal")
  end

  def test_age
    assert_equal(22, @person.age)
  end

  def test_name
    assert_equal("Daniel", @person.name)
  end

  def test_destination
    assert_equal("Ocean Terminal", @person.destination)
  end

end
