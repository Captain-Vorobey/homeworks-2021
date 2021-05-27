# frozen_string_literal: true

class Homework
  def initialize(title:, description:, assigned_students:, mentor:)
    @title = title
    @description = description
    @assigned_students = assigned_students
    @mentor = mentor
  end

  def add_answer(answer)
    @answers ||= []
    @answers << answer
  end
end
