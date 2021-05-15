# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

homework = mentor.add_homework(title: 'HW04', description: 'New homework', student: student)
mentor.subscribe_to_student(student)
mentor.notifications

student.notifications
student.read_notifications!
student.notifications

student.homeworks
student.to_work!(homework)
student.add_answer!(homework, 'New answer')
student.submit_homework!(homework)

mentor.notifications
mentor.read_notifications!
mentor.reject_to_work!(homework)

student.notifications
student.read_notifications!
student.notifications

student.to_work!(homework)
student.add_answer!(homework, 'Correct answer')
student.submit_homework!(homework)

mentor.notifications
mentor.read_notifications!
mentor.accept!(homework)

student.notifications
student.read_notifications!
student.notifications
