class Homework
  attr_accessor :code, :done, :reject, :accept
  attr_reader :title, :student, :description

  def initialize(title, code, description, student)
    @title = title
    @code = code
    @description = description
    @student = student
    @done = false
    @reject = false
    @accept = false
  end

  def change_hm_status!
    @done = true
  end
end
