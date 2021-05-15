# frozen_string_literal: true

class Person
  attr_reader :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def send_notification(notification)
    @notifications << notification
  end

  def read_notifications!
    @notifications.clear
  end
end
