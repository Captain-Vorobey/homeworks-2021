logs = "10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290"

def task_2(content)
  final_arr = []
  arr = content.split("\n")
  arr.select { |line| line.include?('POST') }.map do |line|
    date = line.scan(%r{[0-9]+/[A-z]+/[0-9]+:+[0-9]+:+[0-9]+:+[0-9]+\s+\+[0-9]*})
    from = line.scan(/^[0-9]+\.+[0-9]+\.+[0-9]+\.+[0-9]*/)
    to = line.scan(%r{/[a-z]+/[0-9]+/[a-z]*}).to_s.upcase
    "#{date} FROM: #{from} TO: #{to}"
  end
end

puts task_2(logs)
