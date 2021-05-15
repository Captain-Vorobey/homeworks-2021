# frozen_string_literal: false

# Class Homework is used to create new homeworks for students
class Homework
  attr_reader :title, :description
  attr_accessor :answer, :status

  def initialize(title: '', description: '')
    @title = title
    @description = description
    @answer = ''
    @status = ''
  end

  def add_answer(answer)
    @answer = answer
  end

  def rejected!
    @status = 'rejected'
  end

  def accepted!
    @status = 'accepted'
  end

  def to_s
    "Title - #{@title}, Description - #{@description}"
  end

  def current_status
    "Answer #{@answer} is #{@status}"
  end
end
