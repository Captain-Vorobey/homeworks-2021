# frozen_string_literal: true

YEAR_SECS = 31_536_000
MONTH_SECS = 2_678_400
DAY_SECS = 86_400
HOUR_SECS = 3600
MIN_SECS = 60

def dup_events(lines)
  events = lines.map.with_object([]) do |line, arr|
    msg = line.split('-').last.strip
    arr << msg
  end

  events.select { |event| events.count(event) > 1 }.uniq
end

def calc_difference(first, second)
  f_year, f_month, f_days = first.split(' ')[0].split('-').map(&:to_f)
  f_hours, f_mins, f_secs = first.split(' ')[1].split(':').map(&:to_f)

  s_year, s_month, s_days = second.split(' ')[0].split('-').map(&:to_f)
  s_hours, s_mins, s_secs = second.split(' ')[1].split(':').map(&:to_f)

  end_date = s_year * YEAR_SECS + s_month * MONTH_SECS + s_days * DAY_SECS + s_hours * HOUR_SECS + s_mins * MIN_SECS + s_secs
  start_date = f_year * YEAR_SECS + f_month * MONTH_SECS + f_days * DAY_SECS + f_hours * HOUR_SECS + f_mins * MIN_SECS + f_secs

  (end_date - start_date).round(1).to_s
end

def task3(logs)
  lines = logs.split("\n")
  dups = dup_events(lines)

  return '0' if dups.empty?

  dups.each.with_object([]) do |event, result|
    dup_lines = lines.find_all { |line| line.include?(event) }
    dates = dup_lines.each.with_object([]) { |line, arr| arr << line.split[0..1].join(' ') }

    dates.each_cons(2) do |first, second|
      result << calc_difference(first, second)
    end
  end
end
