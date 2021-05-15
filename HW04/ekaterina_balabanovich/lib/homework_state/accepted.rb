# frozen_string_literal: true

module HomeworkState
  class Accepted < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, homework: homework, status: :accept)
      members.each do |member|
        member.delete_homework(homework)
        HomeworksManager.instance.detach_solver(member, homework)
      end
    end
  end
end
