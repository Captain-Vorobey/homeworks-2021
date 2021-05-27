# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
  end

  def student_notification
    @student.notifications << @title
  end

  def student_homework
    @student.homeworks << "#{@title}: " + @description.to_s
  end

  def homework_approved
    @student.notifications << "#{mentor.name} approved your homework!"
  end
end
