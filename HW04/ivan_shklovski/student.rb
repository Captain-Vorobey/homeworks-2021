# frozen_string_literal: true

class Student
  TO_WORK = 'work started'
  TO_CHECK = 'homework has been sent to review'
  attr_reader :name, :surname, :notifications, :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
  end

  def attach_mentor(mentor)
    @mentor = mentor
  end

  def push_notification(notification)
    @notifications << notification
  end

  def to_work!(homework)
    notification = Notification.new(homework: homework, status: TO_WORK)
    @homeworks << homework
    @mentor.push_notification(notification)
  end

  def mark_as_read!
    @notifications.clear
  end

  def add_answer!(homework, answer)
    homework.add_answer!(answer)
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework, status: TO_CHECK)
    @mentor.push_notification(notification)
  end
end
