PATTERN = "%Y-%m-%d %H:%M:%S.%L"

def collect_core_timestamp(text)
  array_time = []
  text.split("\n").each { |string| array_time << string[/([^ubuntu]+)/] if string =~ /Calling/ }
  array_time.size <= 1 ? 0 : array_time
end

def diff_timestamp(array_time)
  time_diff = []
  (array_time.size - 1).downto(1) { |n|time_diff << edit_time(array_time[n], PATTERN) - edit_time(array_time[n-1], PATTERN) }
  time_diff.reverse
end

def edit_time(date,pattern)
  Time.strptime(date, pattern)
end

puts diff_timestamp(collect_core_timestamp(text))
