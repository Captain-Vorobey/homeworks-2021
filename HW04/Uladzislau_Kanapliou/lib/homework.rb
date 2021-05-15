# frozen_string_literal: true

class Homework
  STATES = {
    undone: 'undone',
    done: 'done',
    in_progress: 'in progress',
    accepted: 'accepted'
  }.freeze

  attr_reader :title, :description, :student
  attr_accessor :answer

  def initialize(title, description, student)
    @student = student
    @title = title
    @description = description
    @answer = ''
    @state = STATES[:undone]
  end
  
  def change_state(state)
    @state = STATES.fetch(state)
  end
end
