# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname
  attr_accessor :notifications, :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(title:, description:, student:, mentor: self)
    @homework = Homework.new(title: title, description: description, student: student, mentor: mentor)
    @homework.student_homework
    @homework
  end

  def notify_student
    abort('Error. No homeworks added.') if @homework.nil?
    @homework.student_notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def approve_hw
    @homework.homework_approved
    "#{name} #{surname} approved #{@homework.student.name}'s homework!"
  end
end
