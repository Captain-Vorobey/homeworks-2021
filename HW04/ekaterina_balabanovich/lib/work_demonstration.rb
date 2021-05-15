# frozen_string_literal: true

require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'

class WorkDemonstration
  def run
    mentor1 = create_mentor('Ivan', 'Stepanov')
    mentor2 = create_mentor('Trevor', 'Dutch')
    student1 = create_student('Arina', 'Vesyolkova')
    student2 = create_student('Stepan', 'Ivanov')

    homework1 = add_homework('HW01', 'Do something', mentor1)
    homework2 = add_homework('HW02', 'Resolve please', mentor1)

    assign_homework(mentor1, student1, homework1)

    join_to_review(mentor2, homework2)
    assign_homework(mentor2, student2, homework2)

    read_notifications(student1)
    read_notifications(student2)

    show_homeworks(student1)
    show_homeworks(student2)

    send_to_check(student1, homework1, 'Long story')
    send_to_check(student2, homework2, 'Hoping')

    read_notifications(mentor1)
    read_notifications(mentor2)

    show_homeworks(mentor1)
    show_homeworks(mentor2)

    show_answers(mentor1)
    show_answers(mentor2)

    accept_work(mentor1, student1, homework1)
    reject_work(mentor2, student2, homework2)

    assign_homework(mentor2, student1, homework2)

    read_notifications(student1)
    read_notifications(student2)

    send_to_check(student2, homework2, 'Fixed')
    send_to_check(student1, homework2, 'My solution')

    read_notifications(mentor2)
    show_answers(mentor2)
  end

  def create_mentor(name, surname)
    puts_with_delimiter("Mentor #{name} #{surname} has been created")
    Mentor.new(name, surname)
  end

  def create_student(name, surname)
    puts_with_delimiter("Student #{name} #{surname} has been created")
    Student.new(name, surname)
  end

  def add_homework(title, description, mentor)
    puts_with_delimiter("Homework #{title} has been created by #{mentor.surname}")
    mentor.create_homework(title: title, description: description)
  end

  def assign_homework(mentor, student, homework)
    puts_with_delimiter("Mentor #{mentor.surname} assigned #{homework.title} to #{student.surname}")
    mentor.assign(homework, student)
  end

  def join_to_review(member, homework)
    member.join_to_check(homework)
    puts_with_delimiter("#{member.class} #{member.surname} joined to review #{homework.title}")
  end

  def read_notifications(member)
    puts_with_delimiter("#{member.class} #{member.surname}\'s notifications:")
    member.notifications.each { |notification| puts notification }
    member.mark_as_read!
  end

  def show_homeworks(member)
    puts_with_delimiter("#{member.class} #{member.surname}\'s homeworks (to work/to check):")
    member.homeworks.each { |homework| puts homework.title }
  end

  def show_answers(member)
    puts_with_delimiter("#{member.class} #{member.surname} see answers")
    member.homeworks.each do |homework|
      puts homework.title
      homework.answers.each(&:show)
    end
  end

  def reject_work(mentor, student, homework)
    puts_with_delimiter("#{mentor.class} #{mentor.surname} rejected #{student.surname}\'s work")
    mentor.reject_to_work!(homework, student)
  end

  def accept_work(mentor, student, homework)
    puts_with_delimiter("#{mentor.class} #{mentor.surname} accepted #{student.surname}\'s work")
    mentor.accept!(homework, student)
  end

  def send_to_check(student, homework, answer)
    student.add_answer!(homework, answer)
    student.to_check!(homework)
    puts_with_delimiter("#{student.class} #{student.surname} finished #{homework.title}")
  end

  def puts_with_delimiter(str)
    puts "#{'-' * 30}\n#{str}"
  end
end
