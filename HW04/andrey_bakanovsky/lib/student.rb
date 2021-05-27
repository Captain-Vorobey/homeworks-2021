# frozen_string_literal: true

LINE = '-' * 86

# defined the Student class
class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def print_notification(notification)
    puts "#{notification.read_status ? 'old' : 'new'}"\
    " From #{notification.sender.surname} #{notification.sender.name[0]}: #{notification.text}"
  end

  def read_notifications!
    puts "#{surname} #{name[0]}. notifications:"
    if @notifications.empty?
      puts 'No notifications.'
    else
      @notifications.each do |notification|
        print_notification(notification)
        notification.read_status = true
      end
    end
    puts "\n"
  end

  def to_work!(homework)
    case homework.status
    when 'to do'
      homework.status = 'in work'
    when 'comments'
      homework.status = 'fixing'
    end
  end

  def print_homeworks_list
    puts "#{surname} #{name[0]}. homeworks list:\n#{LINE}"
    puts format(" %<a>6s | %<b>-30s | %<c>-20s | %<d>-30s \n#{LINE}",
                a: 'Title', b: 'Description', c: 'Mentor', d: 'Status')
    @homeworks.each do |homework|
      puts format(
        ' %<a>6s | %<b>-30s | %<c>-20s | %<d>-30s',
        a: homework.title, b: homework.description,
        c: "#{homework.mentor.name} #{homework.mentor.surname}", d: homework.status
      )
    end
  end

  def homeworks_list
    if @homeworks.empty?
      puts 'No homeworks.'
    else
      print_homeworks_list
    end
    puts "\n"
  end

  def submit_homework!(homework)
    case homework.status
    when 'in work'
      homework.status = 'submitted for verification'
    when 'fixing'
      homework.status = 'corrected'
    end
    homework.mentor.notifications << Notification.new("#{homework.status} #{homework.title}", self)
  end

  def ask_question(question, homework)
    homework.mentor.notifications << Notification.new("#{homework.mentor.name}, #{question} #{homework.title}.", self)
  end
end
