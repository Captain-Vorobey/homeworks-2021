# frozen_string_literal: true

class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @students = []
    @notifications = []
  end
  attr_reader :students
  attr_accessor :notifications

  def add_homework(title:, description:, students:)
    homework = Homework.new(title: title, description: description, assigned_students: students, mentor: self)
    students.each do |student|
       student.homeworks += homework
       send_notification_to_student(student)
    end
  end

  def subscribe_to!(student)
    @students << student
  end

  def mark_as_read!
    notifications.each(&:mark_as_read!)
  end

  def reject_to_work!(homework, student)
    notification = Notification.new(receiver: student, message: 'Homework rejected to work!',
                                    subject: homework)
    student.notifications += notification
  end

  def accept!(homework, student)
    notification = Notification.new(receiver: student, message: 'Homework accepted!')
    student.notifications += notification
  end

  def homeworks_to_check
    homeworks_to_check_notification = notifications.select { |notification| notification.type == :to_check }
    notifications_about_homeworks_to_check.map(&:subject)
  end
  def send_notification_to_student(student)
        notification = Notification.new(receiver: student, message: 'New homework!')
        student.notifications += notification
    end
  end
end
