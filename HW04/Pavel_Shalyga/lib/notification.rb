# Notification class is used to notify students or mentors about changes
class Notification
  attr_accessor :messages

  def initialize
    @messages = []
  end

  def add(message)
    @messages << message
  end
end
