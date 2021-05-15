class Student
  attr_reader :homeworks, :fullname, :notifications
  attr_accessor :mentor

  def initialize(fullname:)
    @fullname = fullname
    @homeworks = []
    @notifications = []
  end

  def to_work!(homework)
    @homeworks << homework
    notification = Notification.new(homework: homework, status: :to_work).message
    mentor.notifications << notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework, status: :to_check).message
    mentor.notifications << notification
  end
end
