# frozen_string_literal: true

class Notification
  attr_accessor :read_status, :read_date
  attr_reader :content, :date

  def initialize(content: :content, date: :date)
    @content = content
    @date = Time.now
    @read_status = 'unread'
    @read_date = nil
  end
end
