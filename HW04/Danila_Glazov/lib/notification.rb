# frozen_string_literal: false

# Class Notification is used to notify students or mentors about homework status
class Notification
  attr_reader :messages

  def initialize
    @messages = []
  end

  def add(message)
    @messages.push(message)
  end

  def check_all!
    @messages.clear
  end
end
