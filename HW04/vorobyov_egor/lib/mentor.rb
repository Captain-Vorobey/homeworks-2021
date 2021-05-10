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
    Notification.create_notification(title, student, @notifications)
    student.homeworks.push(homework)
    homework
  end

  def reject_to_work!(homework, student)
    Notification.create_notification('rejected', student, @notifications)
    homework.status = :rejected
  end

  def accept!(homework, student)
    Notification.create_notification('accept', student, @notifications)
    homework.status = :approved
  end

  def mark_as_read!
    @notifications.map! do |notification|
      notification.read = true
      notification
    end
  end

  def subscribe_to?(student)
    subscribed = nil
    @students.each do |_student|
      _student == student ? subscribed = student : next
    end
    !subscribed.nil? ? true : false
  end
end
