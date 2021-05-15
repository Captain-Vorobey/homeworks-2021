# frozen_string_literal: true

logs = <<~LGSOUTPUT
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
LGSOUTPUT

require 'time'

def date_pars(reg_exp)
  ->(line) { line[reg_exp] }
end

def contains_calling_core?(str)
  str =~ /Calling core/i
end

def task_3(logs)
  result_dtime = []
  time_previos = nil
  execute_pars = date_pars(/\A(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d)/)
  logs.each_line do |line|
    next unless contains_calling_core?(line)

    time = Time.strptime(execute_pars.call(line), '%Y-%m-%d %H:%M:%S.%L').to_f
    result_dtime << (time - time_previos).round(1).to_s unless time_previos.nil?
    time_previos = time
  end
  result_dtime.empty? ? (print "\"0\"\n") : (print result_dtime, "\n")
end

task_3(logs)
