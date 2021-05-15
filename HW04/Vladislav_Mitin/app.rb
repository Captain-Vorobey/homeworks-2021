# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

homework = mentor.add_homework(title: 'HW03',
                               description: 'description homework',
                               student: student)

puts "Student noitifications(#{student.notifications.count}) after add_homework: \n\n"
p student.notifications
puts "----------------------\n\n"

puts "Student homeworks(#{student.homeworks.count}) after add_homework: \n\n"
p student.homeworks
puts "----------------------\n\n"

student.mark_as_read!
puts "Student noitifications(#{student.notifications.count}) after mark_as_read!: \n\n"
p student.notifications
puts "----------------------\n\n"

mentor.subscribe_to!(student)
student.to_work!(homework)

puts "Mentor noitifications(#{mentor.notifications.count}) after to_work!: \n\n"
p mentor.notifications
puts "----------------------\n\n"

mentor.mark_as_read!

puts "Mentor noitifications(#{mentor.notifications.count}) after mark_as_read!: \n\n"
p mentor.notifications
puts "----------------------\n\n"

student.add_answer!(homework, 'new students answer')
student.to_check!(homework)

puts "Mentor noitifications(#{mentor.notifications.count}) after to_check!: \n\n"
p mentor.notifications
puts "----------------------\n\n"

mentor.mark_as_read!
mentor.reject_to_work!(homework)

puts "Student noitifications(#{student.notifications.count}) after reject_to_work!: \n\n"
p student.notifications
puts "----------------------\n\n"

student.mark_as_read!
student.add_answer!(homework, 'new students answer_after reject')
student.to_check!(homework)
mentor.accept!(homework)

puts "Student noitifications(#{student.notifications.count}) after accept!: \n\n"
p student.notifications
puts "----------------------\n\n"

puts "Student homeworks(#{student.homeworks.count}) after accept!: \n\n"
p student.homeworks
