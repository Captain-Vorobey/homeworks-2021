require_relative 'homework'
require_relative 'notification'
require_relative 'participant'

class Student < Participant
  attr_reader :homeworks

  def initialize(name, surname, age)
    super
    @homeworks = []
  end

  def add_answer!(_homework, mentor, comment)
    if mentor.subscribe_to?(self)
      Notification.create_notification(comment + "from #{name}", mentor,
                                       @notifications)
    end
  end

  def to_work!(homework, mentor)
    desc = "#{name} " 'fixed' + homework.title.to_s
    Notification.create_notification(desc, mentor, @notifications) if mentor.subscribe_to?(self)
    homework.status = :done
  end

  def to_refactor!(homework)
    homework.status = :pending_review
    homework.code += ' changes'
  end

  def to_check!(homework, mentor)
    desc = "#{homework.title} " + 'pending review ' + "from student #{name}"
    Notification.create_notification(desc, mentor, @notifications) if mentor.subscribe_to?(self)
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
