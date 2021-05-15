class Participant
  attr_reader :name, :surname, :age, :notifications

  def initialize(name, surname, age)
    @name = name
    @surname = surname
    @age = age
    @notifications = []
  end
end
