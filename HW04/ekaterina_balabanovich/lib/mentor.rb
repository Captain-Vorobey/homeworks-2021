# frozen_string_literal: true

require_relative 'member'
require_relative 'homeworks_manager'

class Mentor < Member
  def create_homework(title:, description:)
    homework = Homework.new(title, description)
    HomeworksManager.instance.attach_new_homework(homework)
    HomeworksManager.instance.attach_reviewer(self, homework)
    homework
  end

  def reject_to_work!(homework, student)
    solver = HomeworksManager.instance.find_solver(student, homework).to_members
    HomeworksManager.instance.transition_to(HomeworkState::Rejected.new, solver, homework)
  end

  def accept!(homework, student)
    solver = HomeworksManager.instance.find_solver(student, homework).to_members
    HomeworksManager.instance.transition_to(HomeworkState::Accepted.new, solver, homework)
  end

  def assign(homework, student)
    HomeworksManager.instance.attach_solver(student, homework)
    solver = HomeworksManager.instance.find_solver(student, homework).to_members
    HomeworkState::New.new.process(solver, homework)
  end

  def join_to_check(homework)
    HomeworksManager.instance.attach_reviewer(self, homework)
  end
end
