# frozen_string_literal: true

module HomeworkState
  class New < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, homework: homework, status: :new)
      members.each { |member| member.add_homework(homework) }
    end
  end
end
