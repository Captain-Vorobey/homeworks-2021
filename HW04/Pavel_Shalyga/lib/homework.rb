# Homework class is used to create new homeworks for students
class Homework
  attr_accessor :status, :title, :description, :solution

  def initialize(title, description)
    @status = :new
    @title = title
    @description = description
  end

  def working!
    @status = :working
  end

  def reject!
    @status = :reject
  end

  def accept!
    @status = :accept
  end
end
