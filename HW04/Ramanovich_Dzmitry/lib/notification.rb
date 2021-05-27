# frozen_string_literal: true

class Notification
  TYPES = %i[
    rejected_to_work
    accepted
    in_progress
    to_check
  ].freeze

  def initialize(receiver:, message:, type:, subject: nil)
    @receiver = receiver
    @message = message
    @subject = subject
    @type = type
    @read = false
  end
  attr_reader :type

  def mark_as_read!
    @read = true
  end
end
