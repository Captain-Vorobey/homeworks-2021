class Homework
  attr_reader :title, :description, :student, :answers

  def initialize(title:, description:, student:)
    @title = title
    @description = description
    @student = student
    @answers = []
  end

  def add_answer!(answer)
    @answers << answer
  end
end
