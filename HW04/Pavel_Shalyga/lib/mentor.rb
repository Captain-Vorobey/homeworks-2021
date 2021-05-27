# The Mentor class is used to create objects that can interact with student objects
class Mentor
  attr_writer :name, :surname
  attr_reader :students
  attr_accessor :notification

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notification = Notification.new
    @students = []
  end

  def notifications
    @notification.messages
  end

  def mark_as_read!
    @notification.messages.clear
  end

  def add_homework(title, description)
    @students.each do |student|
      student.homeworks << Homework.new(title, description)
      student.notification.add("#{@name} #{@surname}: New homework: #{title}, #{description}")
    end
  end

  def subscribe_to!(student)
    @students << student
    student.mentor = self
    student.notification.add("#{@name} #{@surname}: I'm your new mentor")
  end

  def reject!(student, homework, message)
    homework.reject!
    index = @students.index(student)
    @students[index].notification.add("#{@name} #{@surname}: Homework #{homework} rejected, because #{message}")
  end

  def accept!(student, homework)
    homework.accept!
    index = @students.index(student)
    @students[index].notification.add("#{@name} #{@surname}: Homework #{homework} accepted")
  end

  def sent_to(student, message)
    student.notification.add("#{@name} #{@surname}: #{message}")
  end
end
