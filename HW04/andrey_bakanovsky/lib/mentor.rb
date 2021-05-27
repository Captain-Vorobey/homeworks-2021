# frozen_string_literal: true

# defined the Mentor class
class Mentor
  attr_reader :name, :surname, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
  end

  def print_notification(notification)
    puts "#{notification.read_status ? 'old' : 'new'} From #{notification.sender.surname} "\
    "#{notification.sender.name[0]}: #{notification.text}"
  end

  private :print_notification

  def add_homework(title, description, student)
    homework = Homework.new(title, description)
    homework.mentor = self
    homework.student = student
    student.homeworks << homework
    student.notifications << Notification.new("#{homework.status} #{homework.title} - #{homework.description} ",
                                              self)
    homework
  end

  def print_head_notification
    puts "#{surname} #{name[0]}. mentor's notifications:" 
  end

  private :print_head_notification
  
  def read_notifications!
    print_head_notification
    if @notifications.empty? then puts 'No notifications.'
    else
      @notifications.each do |notification|
        print_notification(notification)
        next if notification.text =~ /question?/i

        notification.read_status = true
      end
    end
    puts "\n"
  end

  def print_head_table
    puts "Status of all homework:\n#{'-' * 116}"
    puts format(
      ' %<a>6s | %<b>-30s | %<c>-20s | %<d>-20s | %<e>-30s ',
      a: 'Title',
      b: 'Description',
      c: 'Mentor',
      d: 'Student',
      e: 'Status'
    )
    puts('-' * 116)
  end

  private :print_head_table

  def check_status_homeworks
    print_head_table
    ObjectSpace.each_object(Homework) do |homework|
      puts format(
        ' %<a>6s | %<b>-30s | %<c>-20s | %<d>-20s | %<e>-30s',
        a: homework.title, b: homework.description, c: "#{homework.mentor.name} #{homework.mentor.surname}",
        d: "#{homework.student.name} #{homework.student.surname}",
        e: homework.status
      )
    end
    puts "\n"
  end

  def answer_all_questions!
    if notifications.empty? then puts 'No questions.'
    else
      notifications.each do |notification|
        next unless notification.text =~ /question?/i && notification.read_status != true

        notification.sender.notifications << Notification.new(
          "For your question \"#{notification.text}\", I recommend you to do ... ", self
        )
        notification.read_status = true
      end
    end
  end

  def verification(homework)
    case homework.status
    when 'submitted for verification'
      homework.status = 'comments'
    when 'corrected'
      homework.status = 'accept'
    end
    homework.student.notifications << Notification.new("#{homework.status} #{homework.title}", self)
  end
end
