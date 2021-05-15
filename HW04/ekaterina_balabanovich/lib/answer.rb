# frozen_string_literal: true

class Answer
  attr_reader :student, :answer

  def initialize(student, answer)
    @student = student
    @answer = answer
  end

  def show
    puts "#{student.surname}: #{answer}"
  end
end
