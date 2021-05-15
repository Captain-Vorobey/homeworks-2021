# frozen_string_literal: false

# The Mentor class is used to create objects that can interact with student objects.
class Mentor
  attr_reader :notification
  attr_writer :student

  def initialize(name: '', surname: '')
    @name = name
    @surname = surname
    @notification = Notification.new
    @student = nil
  end

  def add_homework(title: '', description: '', student: nil)
    student.notification.add("#{@name} add new homework")
    Homework.new(title: title, description: description)
  end

  def notifications
    @notification.messages
  end

  def mark_as_read!
    @notification.check_all!
  end

  def subscribe_to!(student)
    self.student = student
    student.mentor = self
  end

  def reject_to_work!(homework)
    homework.rejected!
    @student.notification.add(homework.current_status)
  end

  def accept!(homework)
    homework.accepted!
    @student.notification.add(homework.current_status)
  end
end
