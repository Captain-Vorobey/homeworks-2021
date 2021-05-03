require_relative 'notification'
require_relative 'participant'

class Mentor < Participant
  attr_reader :name, :surname, :age, :students, :role, :notifications

  def initialize(name, surname, age)
    @name = name,
            @surname = surname,
            @age = age,
            @notifications = [],
            @students = [],
            @role = :mentor
  end

  def subscribe_to!(student)
    @students.push(student)
  end

  def add_homework(title, code, description, student)
    homework = Homework.new(title, code, description, student)
    student.create_notification(title, student)
    student.homeworks.push(homework)
    homework
  end

  def reject_to_work!(homework, student)
    student.create_notification('rejected', student)
    homework.done = false
    homework.reject = true
  end

  def accept!(homework, student)
    student.create_notification('accept', student)
    homework.accept = true
  end

  def subscribe_to?(student)
    res = nil
    @students.each do |el|
      el == student ? res = student : next
    end
    !res.nil? ? true : false
  end
end
