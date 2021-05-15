# frozen_string_literal: false

require './lib/mentor'
require './lib/student'
require './lib/homework'
require './lib/notification'

# Module App describes student-mentor relationship
module App
  def self.run
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')
    student = Student.new(name: 'John', surname: 'Doe')

    homework = mentor.add_homework(title: 'HW03',
                                   description: 'description homework',
                                   student: student)

    p student.notifications
    student.mark_as_read!
    p student.notifications

    mentor.subscribe_to!(student)

    p student.homeworks
    student.to_work!(homework)
    p student.homeworks

    p mentor.notifications
    mentor.mark_as_read!
    p mentor.notifications

    p student.homeworks
    student.add_answer!(homework, 'new students answer')
    student.to_check!(homework)

    p mentor.notifications
    mentor.reject_to_work!(homework)

    p student.notifications
    student.mark_as_read!
    student.add_answer!(homework, 'new students answer_after reject')
    student.to_check!(homework)

    mentor.accept!(homework)

    p student.notifications
  end
end
