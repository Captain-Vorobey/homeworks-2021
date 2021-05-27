# frozen_string_literal: true

require_relative 'human'
require_relative 'repository'

class Student < Human
  attr_writer :new_homework, :new_notif_base, :mentors
  include Repository

  def initialize(name: '', surname: '')
    super
    @mentors = []
    @student_homeworks = []
    @status = 'student'
    @access_status = 'unauthorized'
    @new_notif_base = {}
    @archived_notif_base = {}
  end

  def new_notification(new_note)
    @new_notif_base[Time.now] = new_note
  end

  def sent_notification(new_note, mentor)
    mentor.new_notification(new_note)
  end

  def notifications
    @new_notif_base
  end

  def read_notifications!
    @new_notif_base.each_pair do |time, content|
      @archived_notif_base.merge!(time => content)
    end
    @new_notif_base.clear
    'No more new notifications for Student'
  end

  def subscribe_to(mentor)
    @mentors << mentor
    new_notification('New mentor was added')
    "@mentors = #{@mentors}"
  end

  def submit_homework(homework_data)
    @student_homeworks << (Repository.show_all_hw)[homework_data - 1]
    sent_notification("Student took hometask HW0#{homework_data} to working", @mentors[0])
  end

  def submit_homework!(homework_data)
    sent_notification((homework_data < 10) ? ("Student added hometask HW0#{homework_data} to CHECK") : ("Student added hometask HW#{homework_data} to CHECK"), @mentors[0])
  end

  def homeworks
    @student_homeworks
  end

  def show_hw_base
    return Repository.show_all_hw
  end

  def look_hw_base
    if @access_status == 'unauthorized'
      "!!! ACCESS ERROR: Your aren't added as authorized person!"
    elsif @access_status == 'authorized'
      Repository.show_all_hw
    end
  end

  def show_student_information
    "#{@status}: #{@name} #{@surname}"
  end
end
