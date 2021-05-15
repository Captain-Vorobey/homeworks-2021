# frozen_string_literal: true

class Homework
  TODO_STATUS = 'To do'
  WORK_STATUS = 'Working'
  COMPLETED_STATUS = 'Completed'
  REJECT_STATUS = 'Rejected'
  ACCEPT_STATUS = 'Accepted'

  attr_accessor :answer
  attr_reader :student

  def initialize(title:, description:, student:, status: TODO_STATUS, answer: nil)
    @title = title
    @description = description
    @student = student
    @status = status
    @answer = answer
  end

  def todo!
    change_status(TODO_STATUS)
  end

  def work!
    change_status(WORK_STATUS)
  end

  def completed!
    change_status(COMPLETED_STATUS)
  end

  def reject!
    change_status(REJECT_STATUS)
  end

  def accept!
    change_status(ACCEPT_STATUS)
  end

  private

  def change_status(new_status)
    @status = new_status
  end
end
