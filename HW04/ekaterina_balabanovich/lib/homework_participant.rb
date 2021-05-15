# frozen_string_literal: true

class HomeworkParticipant
  attr_reader :member, :homework

  def initialize(member, homework)
    @member = member
    @homework = homework
  end
end
