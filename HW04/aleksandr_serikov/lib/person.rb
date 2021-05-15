# frozen_string_literal: true

# Person
class Person
  attr_reader :name, :surname, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_notification(notification)
    notifications << notification
  end

  def mark_as_read!
    notifications.clear
  end

  def full_name
    "#{name} #{surname}"
  end
end
