require_relative('func')

class MyArray
  include Func

  def initialize(arr = [])
    @arr = arr
  end

  def each(&block)
    @arr.each do |el|
      block.call(el)
    end
  end

  def map(&block)
    read(@arr, &block)
  end

  def select(&block)
    read_and_push_valid(@arr, &block)
  end
end
