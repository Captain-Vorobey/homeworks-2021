# frozen_string_literal: true

# defined the Homework class
class Homework
  attr_reader :title, :description
  attr_accessor :mentor, :student, :status

  def initialize(title, description, status = 'to do')
    @title = title
    @description = description
    @mentor = mentor
    @student = student
    @status = status
  end
end
