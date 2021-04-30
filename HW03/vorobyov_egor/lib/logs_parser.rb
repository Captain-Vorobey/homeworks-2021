require_relative 'parsing_functions'

module LogsParser
  include ParsingFunctions

  def self.task_1(logs)
    logs.each_line do |el|
      return el if ParsingFunctions.with_error?(el)
    end
    ''
  end

  def self.task_2(logs)
    arr = []
    logs.each_line do |el|
      arr.push(ParsingFunctions.formatted(el)) unless ParsingFunctions.with_error?(el)
    end
    arr
  end

  def self.task_3(logs)
    0 if logs.length < 2
    res = []
    logs.each_with_index do |el, i|
      date_diffirence = ParsingFunctions.dates_difference(el, logs[i + 1]) unless logs[i + 1].nil?
      res.push(date_diffirence)
    end
    res.pop
    res
  end

  def self.task_4(word)
    { letters: word.count('A-Za-z'), digits: word.count('0-9') }
  end
end
