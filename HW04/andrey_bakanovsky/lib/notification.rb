# frozen_string_literal: true

# defined the Notification class
class Notification
  attr_accessor :text, :sender, :read_status

  def initialize(text, sender, read_status: false)
    @text = text
    @sender      = sender
    @read_status = read_status
  end
end
