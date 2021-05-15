# frozen_string_literal: false

# The Student class is used to create objects that can interact with mentor objects.
class Student
  attr_reader :notification, :homeworks
  attr_writer :mentor

  def initialize(name: '', surname: '')
    @name = name
    @surname = surname
    @notification = Notification.new
    @homeworks = []
    @mentor = nil
  end

  def notifications
    @notification.messages
  end

  def mark_as_read!
    @notification.check_all!
  end

  def to_work!(homework)
    @homeworks.push(homework.to_s)
    @mentor.notification.add("#{@name} is working on #{homework}")
  end

  def add_answer!(homework, answer)
    homework.add_answer(answer)
  end

  def to_check!(homework)
    @mentor.notification.add("Homework to check: #{homework}")
  end
end
