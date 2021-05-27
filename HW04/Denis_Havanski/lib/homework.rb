# frozen_string_literal: true

class Homework
  attr_accessor :m_comment, :date_dl
  attr_reader :task, :post_comment, :date_post, :title
  attr_writer :status, :st_comment

  def initialize(title, task, post_comment, date_dl)
    @title = title
    @task = task
    @post_comment = post_comment
    @date_dl = date_dl
    @date_post = Time.now
    @status = 'posted_by_mentor'
    @comments = {}
  end

  def about
    "Homework #{title}:\n task: #{task} \n DL: #{date_dl}"
  end
end
