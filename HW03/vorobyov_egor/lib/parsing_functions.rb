require 'time'

DATE = %r{\d{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}}.freeze
IP = /\d{2}\.\d\.\d{3}\.\d{3}/.freeze
ADDRESS = %r{\s/\w{1,}/\d/\w{1,}}.freeze

module ParsingFunctions
  def self.formatted(el)
    date = el.match(DATE).to_s
    ip = el.match(IP).to_s
    address = el.match(ADDRESS).to_s

    date + ' FROM: ' + ip + ' TO:' + address.upcase
  end

  def self.calling_core_logs(logs)
    new_arr = []
    logs.each do |el|
      if el.include? 'Calling core with action:'
        date = el.split(' ubuntu')[0]
        new_arr.push(date)
      end
    end
    new_arr
  end

  def self.dates_difference(first, second)
    Time.parse(second) - Time.parse(first)
  end
end
