def task1(logs)
  logs.split(/\n/).find { |line| line.downcase.include?('error') }.to_s
end
