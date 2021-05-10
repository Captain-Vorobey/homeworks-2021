require_relative 'homework'
require_relative 'notification'
require_relative 'participant'

class Student < Participant
  attr_reader :homeworks, :role

  def initialize(name, surname, age)
    super
    @homeworks = []
    @role = :student
  end

  def add_answer!(_homework, mentor, comment)
    Notification.create_notification(comment, mentor, @notifications) if mentor.subscribe_to?(self)
  end

  def to_work!(homework, mentor)
    Notification.create_notification('fix', mentor, @notifications) if mentor.subscribe_to?(self)
    homework.status = :done
  end

  def to_refactor!(homework)
    homework.status = :pending_review
    homework.code += ' changes'
  end

  def to_check!(_homework, mentor)
    Notification.create_notification('pending review', mentor, @notifications) if mentor.subscribe_to?(self)
  end

  def mark_as_read!
    @notifications.map! do |notification|
      notification.read = true
      notification
    end
  end

  def done_homeworks
    done_homeworks = []
    @homeworks.each do |homework|
      homework.status == :approved ? done_homeworks.push(homework) : next
    end
    done_homeworks
  end
end
