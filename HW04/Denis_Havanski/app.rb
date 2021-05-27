# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'
require_relative 'lib/human'

student = Student.new(name: 'John', surname: 'Doe')
student.show_student_information

mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')
mentor.show_mentor_information

homework = Homework.new('HW01', 'make...', 'now!', '01.02.2021')
homework.about

mentor.change_hometask(homework, changes: { :@date_dl => '16.02.2021', :@task => 'Implement your own ...' })
homework.about

student.look_hw_base

mentor.subscribe_to(student)
mentor.notifications
student.notifications

student.subscribe_to(mentor)

mentor.read_notifications!
mentor.notifications
student.read_notifications!
student.notifications

mentor.add_new_home_task('HW01', 'Add some...', 'HARD!!!', '01.02.2021')
student.notifications

student.submit_homework(11)
student.homeworks
mentor.notifications
mentor.read_notifications!

student.submit_homework!(11)
mentor.notifications

student.look_hw_base
mentor.look_hw_base
