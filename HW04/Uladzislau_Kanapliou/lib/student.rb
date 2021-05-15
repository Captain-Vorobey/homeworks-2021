# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :notifications, :mentors, :homeworks
  
  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
    @mentors = []
  end

  def mark_as_read!
    notifications.clear
  end

  def attach_mentor(mentor)
    @mentors << mentor
  end

  def to_work!(homework)
    homework.change_state(:in_progress)
    notify_mentors("#{homework.title} - #{homework.state}")
  end

  def add_answer!(homework, notification_message)
    homework.change_state(:done)
    homework.answer = notification_message
    notify_mentors("#{@name} #{@surname} add answer: #{notification_message} to #{homework.title}")
  end

  def to_check!(homework)
    notify_mentors("#{homework.title} done, please check")
  end

  def add_notification(message)
    notifications << Notification.new(name, surname, message)
  end

  def notify(mentor, message)
    mentor.add_notification(message)
  end

  def notify_mentors(message)
    mentors.each { |mentor| notify(mentor, message) }
  end
end
