require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new('Pavel', 'Shalyga')
mentor = Mentor.new('Jack', 'Gonsales')
student2 = Student.new('Ivan', 'Ivanov')

# mentor subscribe to student
mentor.subscribe_to!(student)
mentor.subscribe_to!(student2)

# mentor add new homework
mentor.add_homework('HW03', 'description homework')

# student see notification about new homework
puts student.notifications
# student mark as read all notifications
student.mark_as_read!

# student take to work homework
puts student.homeworks
student.to_work!(student.homework, 'I added project files')
puts student.homeworks

puts student2.homeworks

# mentor see notification about homework to work
puts mentor.notifications
# mentor mark as read all notifications
mentor.mark_as_read!

# student sent to check homework
student.to_check!(student.homework)

# mentor see notification about homework to check
puts mentor.notifications
mentor.mark_as_read!
# mentor reject homework
mentor.reject!(student, student.homework, 'you have mistakes')

# student see notification about homework was reject
puts student.notifications
student.mark_as_read!
student.add_answer(student.homework, 'I changed project files')
puts student.homeworks
student.to_check!(student.homework)

puts mentor.notifications
mentor.mark_as_read!
# mentor accept homework
mentor.accept!(student, student.homework)

# student see notification about homework was accept
puts student.notifications
student.mark_as_read!

# simple dialog between student and mentor
student.sent_to(mentor, 'Test message')
puts mentor.notifications
mentor.mark_as_read!

mentor.sent_to(student, 'Test answer')
puts student.notifications
student.mark_as_read!

student.sent_to(mentor, 'Thanks')
puts mentor.notifications
mentor.mark_as_read!

puts student2.homeworks
student2.to_work!(student2.homework, 'I added project files')
puts student2.homeworks
student2.to_check!(student2.homework)

# mentor see notification about homework to check
puts mentor.notifications
mentor.mark_as_read!
mentor.accept!(student2, student2.homework)

puts student2.homework.status
