require_relative './lib/mentor'
require_relative './lib/student'

student = Student.new('Egor', 'Vorobyov', 20)
mentor = Mentor.new('Boris', 'Tsarikov', 20)

homework = mentor.add_homework('HW04', 'code', 'some desc', student)

student.notifications

student.mark_as_read!

mentor.subscribe_to!(student)

student.homeworks

student.to_work!(homework, mentor)

student.homeworks

mentor.notifications

mentor.mark_as_read!

mentor.notifications

student.homeworks

student.add_answer!(homework, mentor, 'How can I fix it and be merged to master?')

student.to_check!(homework, mentor)

mentor.notifications

mentor.reject_to_work!(homework, student)

student.to_refactor!(homework)

student.notifications

student.add_answer!(homework, mentor, 'new students answer_after reject')

student.to_check!(homework, mentor)

mentor.accept!(homework, student)

student.mark_as_read!

p '+++++++++++++++++++++'
p student.notifications

p '--------------------'
p mentor.notifications
