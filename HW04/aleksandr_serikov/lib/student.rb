# frozen_string_literal: true

require_relative 'person'

# Student
class Student < Person
  attr_reader :mentor, :homeworks

  def initialize(*params)
    super(*params)
    @homeworks = []
  end

  def subscribed(senpai)
    @mentor ||= senpai
  end

  def unsubscribed
    @mentor = nil
  end

  def add_homework(homework)
    homeworks << homework
  end

  def to_work!(homework)
    homework.to_work!
  end

  def to_check!(homework)
    homework.to_check!
  end

  def add_answer!(homework)
    homework.add_answer!
  end
end
