# frozen_string_literal: true

require_relative 'notification'

# Homework
class Homework
  attr_reader :title, :description, :mentor, :student, :status

  def initialize(title, description, student, mentor)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @status = nil
  end

  def change_status(new_status)
    @status = new_status.to_s
  end

  def to_work!
    mentor.add_notification(Notification.new(self, __method__))
    change_status(__method__)
  end

  def to_check!
    mentor.add_notification(Notification.new(self, __method__))
    change_status(__method__)
  end

  def add_answer!
    mentor.add_notification(Notification.new(self, __method__))
    change_status(__method__)
  end

  def reject_to_work!
    student.add_notification(Notification.new(self, __method__))
    change_status(__method__)
  end

  def accept!
    student.add_notification(Notification.new(self, __method__))
    change_status(__method__)
  end

  def add_homework!
    student.add_notification(Notification.new(self, __method__))
    change_status('to do')
  end
end
