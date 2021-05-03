class Notification
  attr_accessor :read

  def initialize(name)
    @name = name
    @date = Time.now
    @read = false
  end

  def has_role?(role)
    self.role == role
  end

  def mark_as_read!
    @notifications.map! do |el|
      el.read = true
      el
    end
  end

  def create_notification(desc_notification, person)
    if person.has_role? :student
      @notifications.push(Notification.new("STUDENT notification: #{desc_notification}"))
    elsif person.has_role? :mentor
      @notifications.push(Notification.new("MENTOR notification: #{desc_notification}"))
    end
  end
end
