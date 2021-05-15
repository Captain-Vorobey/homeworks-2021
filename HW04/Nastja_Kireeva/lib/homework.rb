class Homework
  attr_reader :answers, :student, :mentor, :title

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answers = []
  end
end
