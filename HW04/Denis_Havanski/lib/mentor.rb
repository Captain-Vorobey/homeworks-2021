# frozen_string_literal: true

require_relative 'human'
require_relative 'repository'

class Mentor < Human
  attr_accessor :students
  attr_writer :new_notif_base
  include Repository

  def initialize(name: '', surname: '')
    super
    @status = 'mentor'
    @students = []
    @access_status = 'authorized'
    @new_notif_base = {}
    @archived_notif_base = {}
  end

  def new_notification(new_note)
    @new_notif_base[Time.now] = new_note
  end

  def sent_notification(new_note, student)
    student.new_notification(new_note)
  end

  def subscribe_to(student)
    @students << student
    student.instance_variable_set(:@access_status, 'authorized')
    "#{student} are authorized by #{self}"
    new_notification('New student was added')
  end

  def notifications
    @new_notif_base
  end

  def read_notifications!
    @new_notif_base.each_pair do |time, content|
      @archived_notif_base.merge!(time => content)
    end
    @new_notif_base.clear
    'No more new notifications for Mentor'
  end

  def add_new_home_task(title, task, post_comment, date_dl)
    new_home_task = Homework.new(title, task, post_comment, date_dl)
    Repository.add_into_all_hw(new_home_task)
    st_number = @students.size
    for st_index in (0...st_number) do
    sent_notification("Mentor add new home-task #{title}", @students[st_index])
    end
  end

  def change_hometask(homework, changes: :hash)
    changes.each_pair do |point, new_content|
      homework.instance_variable_set(point, new_content)
      "The new #{point} of #{homework} is: #{new_content} \n"
    end
  end

  def show_mentor_information
    "#{@status}: #{@name} #{@surname}"
  end

  def look_hw_base
    return (Repository::show_all_hw)
  end

  def add_to_hw_base(elem)
    return (Repository.add_into_all_hw(elem))
  end
end
