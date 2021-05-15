# frozen_string_literal: true

require 'singleton'
require_relative 'members_manager'
require_relative 'homework_state/base'
require_relative 'homework_state/new'
require_relative 'homework_state/done'
require_relative 'homework_state/rejected'
require_relative 'homework_state/accepted'

class HomeworksManager
  include MembersManager
  include Singleton

  attr_reader :homeworks, :state, :notifications

  def initialize
    @reviewers = []
    @solvers = []
    @homeworks = []
  end

  def transition_to(state, members, homework)
    @state = state
    state.process(members, homework)
  end

  def attach_new_homework(homework)
    homeworks << homework
  end

  def notify(members:, homework:, status:)
    members.each { |member| member.add_notifications(Notification.new(homework, status).message) }
  end
end
