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
    mentor.create_notification(comment, mentor) if mentor.subscribe_to?(self)
  end

  def to_work!(homework, mentor)
    mentor.create_notification('fix', mentor) if mentor.subscribe_to?(self)
    homework.status = :done
  end

  def to_refactor!(homework)
    homework.status = :pending_review
    homework.code += ' changes'
  end

  def to_check!(_homework, mentor)
    mentor.create_notification('pending review', mentor) if mentor.subscribe_to?(self)
  end

  def done_homeworks
    done_homeworks = []
    @homeworks.each do |homework|
      homework.status == :approved ? done_homeworks.push(homework) : next
    end
    done_homeworks
  end
end
