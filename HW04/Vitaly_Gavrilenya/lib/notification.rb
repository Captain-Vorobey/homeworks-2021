# frozen_string_literal: true

class Notification
  attr_reader :homework, :description

  def initialize(homework, description)
    @homework = homework
    @description = description
  end
end
