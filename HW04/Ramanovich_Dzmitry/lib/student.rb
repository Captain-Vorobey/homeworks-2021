# frozen_string_literal: true

class Student
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
    @homeworks_in_progress = []
  end
  attr_accessor :notifications, :homeworks

  def mark_as_read!
    @notifications.each(&:mark_as_read!)
  end

  def to_work!(homework)
    @homeworks_in_progress << homework

    if homework.mentor.students.include?(self)
      notification = Notification.new(receiver: homework.mentor, message: 'New homework in progress!')
      homework.mentor.notifications += notification
    else
      notifications_about_subscribe
    end
  end

  def add_answer!(homework, answer)
    homework.add_answer(answer)
  end

  def to_check!(homework)
    if homework.mentor.students.include?(self)
      notification = Notification.new(receiver: homework.mentor, message: 'New homework to check!',
                                      subject: homework)
      homework.mentor.notifications += notification
    else
      notifications_about_subscribe
  end

  def rejected_homeworks
    reject_notifications = notifications.select { |notification| notification.type == :rejected_to_work }
    reject_notifications.map(&:subject)
  end

  private

  def notifications_about_subscribe
    puts 'To receive notifications from this student, please subscribe!' 
  end
end
