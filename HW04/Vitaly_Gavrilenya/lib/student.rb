# frozen_string_literal: true

require_relative 'person'

class Student < Person
  attr_reader :homeworks

  def initialize(name:, surname:)
    super
    @homeworks = []
    @mentors = []
  end

  def add_mentor(mentor)
    @mentors << mentor
  end

  def add_homework(homework)
    @homeworks << homework
    notification = Notification.new(homework, 'Homework added!')
    send_notification(notification)
  end

  def submit_homework!(homework)
    @mentors.each do |mentor|
      notification = Notification.new(homework, 'Student submited homework!')
      mentor.send_notification(notification)
    end
    homework.completed!
  end

  def to_work!(homework)
    homework.work!
  end

  def add_answer!(homework, answer)
    homework.answer = answer
  end
end
