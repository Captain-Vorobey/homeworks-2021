class Homework
  attr_accessor :code, :status
  attr_reader :title, :student, :description

  def initialize(title, code, description, student)
    @title = title
    @code = code
    @description = description
    @student = student
    @status = :published
  end
end
