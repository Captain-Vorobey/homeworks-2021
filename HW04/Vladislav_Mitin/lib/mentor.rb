# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @notifications = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student, mentor: self)
    notification = Notification.new(homework: homework, text: "New homework: #{homework.title}")

    student.homeworks << homework
    homework.notify_student(notification)

    homework
  end

  def subscribe_to!(student)
    subscriptions << student
  end

  def mark_as_read!
    @notifications.clear
  end

  def reject_to_work!(homework)
    notification = Notification.new(homework: homework, text: "Answers was rejected: #{homework.title}")
    homework.notify_student(notification)
    homework.status = 'rejected'
  end

  def accept!(homework)
    notification = Notification.new(homework: homework, text: "Homework was accepted: #{homework.title}")
    homework.notify_student(notification)
    homework.status = 'accepted'
  end

  private

  attr_reader :subscriptions
end
