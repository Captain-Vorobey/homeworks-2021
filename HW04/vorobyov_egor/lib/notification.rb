class Notification
  attr_accessor :read

  def initialize(name)
    @name = name
    @date = Time.now
    @read = false
  end

  def self.create_notification(desc_notification, _person, notifications)
    notifications.push(Notification.new(desc_notification))
  end
end
