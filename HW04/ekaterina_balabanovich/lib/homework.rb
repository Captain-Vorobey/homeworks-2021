# frozen_string_literal: true

require_relative 'answer'

class Homework
  attr_reader :title, :description, :answers

  def initialize(title, description)
    @title = title
    @description = description
    @answers = []
  end

  def solve(answer, student)
    delete_existed_answer(student)
    answers << Answer.new(student, answer)
  end

  private

  def delete_existed_answer(student)
    existed_answer = find_answer_by_student(student)
    return if existed_answer.nil?

    answers.delete(existed_answer)
  end

  def find_answer_by_student(student)
    answers.select { |answer| answer.student == student }.first
  end
end
