# frozen_string_literal: true

require_relative 'homework_participant'

module MembersManager
  attr_accessor :reviewers, :solvers

  def attach_reviewer(member, homework)
    reviewers << HomeworkParticipant.new(member, homework)
  end

  def attach_solver(member, homework)
    solvers << HomeworkParticipant.new(member, homework)
  end

  def detach_reviewer(member, homework)
    reviewers.delete(find_reviewer(member, homework))
  end

  def detach_solver(member, homework)
    solvers.delete(find_solver(member, homework))
  end

  def find_reviewer(member, homework)
    reviewers.select { |reviewer| reviewer.member == member && reviewer.homework == homework }.first.member
  end

  def find_solver(member, homework)
    solvers.select { |solver| solver.member == member && solver.homework == homework }.first.member
  end

  def find_reviewers_by_homework(homework)
    reviewers.select { |reviewer| reviewer.homework == homework }.map(&:member)
  end

  def find_solvers_by_homework(homework)
    solvers.select { |solver| solver.homework == homework }.map(&:member)
  end
end
