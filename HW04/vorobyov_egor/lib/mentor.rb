require_relative 'homework'
require_relative 'notification'
require_relative 'participant'

class Mentor < Participant
  attr_reader :students, :role

  def initialize(name, surname, age)
    super
    @students = []
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
    homework.status = :rejected
  end

  def accept!(homework, student)
    student.create_notification('accept', student)
    homework.status = :approved
  end

  def subscribe_to?(student)
    subscribed = nil
    @students.each do |_student|
      _student == student ? subscribed = student : next
    end
    !subscribed.nil? ? true : false
  end
end
