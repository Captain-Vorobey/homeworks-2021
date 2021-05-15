# frozen_string_literal: true

module HomeworkState
  class Done < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, homework: homework, status: :done)
      members.each { |member| member.add_homework(homework) unless member.homeworks.include?(homework) }
    end
  end
end
