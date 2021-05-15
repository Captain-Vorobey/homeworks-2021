require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

module App
  def self.run
    student = Student.new(fullname: 'Sam Smith')
    mentor = Mentor.new(fullname: 'Jack Gonsales')

    homework = mentor.add_homework(title: 'HW03',
                                   description: 'description homework',
                                   student: student, mentor: mentor)

    p student.notifications
    student.mark_as_read!

    mentor.subscribe_to!(student)

    student.to_work!(homework)
    student.homeworks
    p mentor.notifications
    mentor.mark_as_read!
    mentor.notifications

    student.homeworks
    student.add_answer!(homework, 'answer')
    student.to_check!(homework)

    p mentor.notifications
    mentor.mark_as_read!
    mentor.reject_to_work!(homework, student)
    p student.notifications

    student.mark_as_read!
    student.add_answer!(homework, 'new answer after reject')
    student.to_check!(homework)

    p mentor.notifications
    mentor.accept!(homework, student)
    p student.notifications
  end
end
