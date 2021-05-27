# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

mentor1 = Mentor.new('John', 'Smith')
mentor2 = Mentor.new('Van', 'Halen')
student1 = Student.new('Sam', 'Hunt')

homework1 = mentor1.add_homework('HW01', 'Work with the Objects', student1)
homework2 = mentor1.add_homework('HW02', 'Work with the Metaprogramming', student1)
homework3 = mentor2.add_homework('HW03', 'Feel atmosphere', student1)

student1.read_notifications!
student1.homeworks_list
student1.to_work!(homework1)
student1.homeworks_list

student1.ask_question('I have a question for you about', homework1)
mentor1.read_notifications!
mentor1.answer_all_questions!
student1.read_notifications!

mentor2.read_notifications!

mentor1.check_status_homeworks

student1.submit_homework!(homework1)
mentor1.read_notifications!
mentor1.verification(homework1)

mentor1.check_status_homeworks

student1.read_notifications!
student1.to_work!(homework1)
student1.submit_homework!(homework1)

mentor1.read_notifications!
mentor1.verification(homework1)
student1.read_notifications!

student1.homeworks_list
student1.to_work!(homework2)
student1.to_work!(homework3)
student1.submit_homework!(homework2)
student1.submit_homework!(homework3)
student1.homeworks_list

mentor1.read_notifications!
mentor2.read_notifications!
mentor1.verification(homework2)
mentor2.read_notifications!
mentor2.verification(homework3)

student1.read_notifications!

student1.to_work!(homework2)
student1.to_work!(homework3)
student1.submit_homework!(homework2)
student1.submit_homework!(homework3)

mentor1.read_notifications!
mentor1.verification(homework2)
mentor2.read_notifications!
mentor2.verification(homework3)

mentor1.check_status_homeworks
