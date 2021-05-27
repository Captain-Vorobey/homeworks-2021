# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :notifications, :homeworks

  def initialize(name:, surname:, mentor:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
    @mentor = mentor
  end

  def mark_as_read!
    @notifications.clear
  end

  def to_work!
    @homeworks.clear
  end

  def to_check!
    @mentor.notifications << "#{name} #{surname} has done homework!"
  end
end
