class Person
  attr_reader :age, :name, :destination
  def initialize(age, name, destination)
    @age, @name, @destination = age, name, destination
  end
end
