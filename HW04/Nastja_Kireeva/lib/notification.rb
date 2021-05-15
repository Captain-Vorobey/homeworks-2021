class Notification
  attr_reader :homework, :status

  def initialize(homework:, status:)
    @homework = homework
    @status = status
  end

  def message
    { new: new_message,
      to_work: to_work_message,
      to_check: to_check_message,
      reject: reject_message,
      accept: accept_message }[status]
  end

  def new_message
    "#{homework.mentor.fullname} has assigned a new homework for you. See #{homework.title}"
  end

  def to_work_message
    "A student #{homework.student.fullname} takes #{homework.title} to work"
  end

  def to_check_message
    "The homework #{homework.title} is ready to be checked"
  end

  def reject_message
    "#{homework.mentor.fullname} has rejected your homework #{homework.title}"
  end

  def accept_message
    "#{homework.mentor.fullname} has accepted your homework #{homework.title}"
  end
end
