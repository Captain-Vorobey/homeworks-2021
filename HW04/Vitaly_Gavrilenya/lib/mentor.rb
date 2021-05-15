# frozen_string_literal: true

require_relative 'person'

class Mentor < Person
  def initialize(name:, surname:)
    super
    @students_mentored = []
  end

  def subscribe_to_student(student)
    student.add_mentor(self)
    @students_mentored << student
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student)
    student.add_homework(homework)
    homework
  end

  def reject_to_work!(homework)
    notification = Notification.new(homework, 'Homework rejected!')
    homework.student.send_notification(notification)
    homework.reject!
  end

  def accept!(homework)
    notification = Notification.new(homework, 'Homework accepted!')
    homework.student.send_notification(notification)
    homework.accept!
  end
end
