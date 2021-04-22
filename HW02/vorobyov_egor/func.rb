require_relative('predicates')

module Func
  include Predicates

  def read(arr, &block)
    res = []
    for el in arr
      res.push(block.call(el))
    end
    res
  end

  def read_and_push_valid(arr, &block)
    res = []
    arr.each do |el|
      valid(el, &block) ? res.push(valid(el, &block)) : next
    end
    res
  end
end
