class Participant < Notification
  def has_role?(role)
    self.role == role
  end
end
