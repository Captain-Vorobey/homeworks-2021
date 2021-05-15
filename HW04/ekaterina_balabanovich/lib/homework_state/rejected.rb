# frozen_string_literal: true

module HomeworkState
  class Rejected < Base
    def process(members, homework)
      HomeworksManager.instance.notify(members: members, homework: homework, status: :reject)
    end
  end
end
