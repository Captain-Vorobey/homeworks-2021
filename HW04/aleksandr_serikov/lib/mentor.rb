# frozen_string_literal: true

require_relative 'person'
require_relative 'homework'

# The senpai class that teaches young Padawans
class Mentor < Person
  attr_reader :students

  def initialize(name, surname)
    super
    @students = []
  end

  def reject_to_work!(homework)
    homework.reject_to_work!
  end

  def accept!(homework)
    homework.accept!
  end

  def add_homework(title, description, student)
    if students.include?(student)
      new_homework = Homework.new(title, description, student, self)
      student.add_homework(new_homework)
      new_homework.add_homework!
      new_homework
    else
      raise 'You are not subscribed to this student'
    end
  end

  def subscribe(student)
    students << student
  end

  def unsubscribe(student)
    students.delete!(student)
  end

end
