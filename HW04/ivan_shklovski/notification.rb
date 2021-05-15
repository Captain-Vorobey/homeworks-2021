# frozen_string_literal: true

class Notification
  attr_reader :homework, :status

  def initialize(homework:, status: nil)
    @homework = homework
    @status = status
  end

  def to_s
    status || 'empty notification'
  end
end
