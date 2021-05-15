class Mentor
  attr_reader :homeworks, :fullname, :students, :notifications
  attr_accessor :student

  def initialize(fullname:)
    @fullname = fullname
    @homeworks = []
    @notifications = []
    @students = []
  end

  def add_homework(title:, description:, student:, mentor:)
    homework = Homework.new(title: title, description: description, student: student, mentor: mentor)
    homeworks << homework
    notification = Notification.new(homework: homework, status: :new).message
    student.notifications << notification
    homework
  end

  def mark_as_read!
    @notifications.clear
  end

  def subscribe_to!(student)
    @students << student
    student.mentor = self
  end

  def reject_to_work!(homework, student)
    notification = Notification.new(homework: homework, status: :reject).message
    student.notifications << notification
  end

  def accept!(homework, student)
    notification = Notification.new(homework: homework, status: :accept).message
    student.notifications << notification
  end
end
