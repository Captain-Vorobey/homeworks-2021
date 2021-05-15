# frozen_string_literal: true

require_relative 'lib/mentor'
require_relative 'lib/student'

puts
mentor = Mentor.new('John', 'Doe')
puts "create mentor: #{mentor.full_name}"
student = Student.new('Vasya', 'Pupkin')
puts "create student: #{student.full_name}"

puts
puts 'mentor subscribe student'
puts "mentor students before subscribe: #{mentor.students.size}"
mentor.subscribe(student)
puts "mentor students after subscribe: #{mentor.students.size}"

puts
puts "student homework size: #{student.homeworks.size}"
puts "student notification messages: #{student.notifications.size}"

puts
puts 'mentor add homework to student'
homework = mentor.add_homework('first', 'bla la la', student)
puts "student homework size: #{student.homeworks.size}"
puts "homework status: #{homework.status}"
puts "student notification messages: #{student.notifications.size}"

puts
puts 'student take to work homework'
student.to_work!(homework)
puts "homework status: #{homework.status}"
puts "mentor notification messages: #{mentor.notifications.size}"

puts
puts 'student sent to check homework'
student.to_check!(homework)
puts "homework status: #{homework.status}"
puts "mentor notification messages: #{mentor.notifications.size}"
puts

puts 'mentor reject homework'
mentor.reject_to_work!(homework)
puts "homework status: #{homework.status}"
puts "student notification messages: #{student.notifications.size}"

puts
puts 'student take to work homework'
student.to_work!(homework)
student.to_check!(homework)
puts "homework status: #{homework.status}"

puts
puts 'mentor accept homework'
mentor.accept!(homework)
puts "homework status: #{homework.status}"

puts
puts "student notification size: #{student.notifications.size}"
puts "mentor notification size: #{mentor.notifications.size}"
puts 'mentor and student use method mark_as_read!'
mentor.mark_as_read!
student.mark_as_read!
puts "student notification size: #{student.notifications.size}"
puts "mentor notification size: #{mentor.notifications.size}"
