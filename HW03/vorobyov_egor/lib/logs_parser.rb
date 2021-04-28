require_relative 'parsing_functions'
require_relative 'predicates'

module LogsParser
  include ParsingFunctions
  include Predicates

  def self.task_1(*logs)
    logs.each do |el|
      return el if Predicates.has_error?(el)
    end
    ''
  end

  def self.task_2(*logs)
    arr = []
    logs.each do |el|
      arr.push(ParsingFunctions.formatted(el)) unless Predicates.has_error?(el)
    end
    arr
  end

  def self.task_3(logs)
    0 if logs.length < 2

    res = []
    new_el = ''
    logs.each_with_index do |_el, i|
      new_el = ParsingFunctions.dates_difference(logs[i], logs[i + 1]) if logs[i + 1] != nil
      res.push(new_el)
    end
    res.pop
    res
  end

  def self.task_4(word)
    { letters: word.count('A-Za-z'), digits: word.count('0-9') }
  end
end
