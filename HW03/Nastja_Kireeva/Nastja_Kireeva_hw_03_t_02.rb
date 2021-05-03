DATETIME = /(?<=\[).*(?=\])/.freeze
IP = /^\d{2}.\d{1}.\d{3}.\d+/.freeze
ADDRESS = %r{/\w+/\d+/\w+}.freeze

def task2(logs)
  lines = logs.split(/\n/)

  lines.select { |line| line.include?('POST') }.map do |line|
    datetime = line.scan(DATETIME).first
    address = line.scan(ADDRESS).first.upcase
    ip = line.scan(IP).first
    "#{datetime} FROM: #{ip} TO: #{address}"
  end
end
