# frozen_string_literal: true

# class contains homework object and message
class Notification
  attr_reader :homework, :message

  def initialize(homework, message)
    @homework = homework
    @message = message.to_s
  end
end
