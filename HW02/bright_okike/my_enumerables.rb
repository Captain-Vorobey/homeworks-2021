# my enumerables module
module MyEnumerables
  def my_each
    self.length.times do |x|
      yield(self[x])
    end
  end

  def my_map(proc = nil)
    arr = []
    if proc
      self.length.times do |x|
        arr.push(proc.call(self[x]))
      end
    else
      self.length.times do |x|
        arr.push(yield(self[x]))
      end
    end
    arr
  end

  def my_select
    arr = []
    self.length.times do |x|
      if yield(self[x])
        arr.push(self[x])
      end
    end
    arr
  end

  def my_all?
    self.length.times do |x|
      !yield(self[x]) ? false : true
    end
  end

  def my_any?
    self.length.times do |x|
      return true if yield(self[x]) != false
    end
    false
  end

  def my_none?
    self.length.times do |x|
      return false if yield(self[x])
    end
    true
  end

  def my_count(arg = nil)
    arr = []
    if block_given?
      arr = self.my_select { |x| yield(x) }
    elsif !arg.nil?
      arr = self.my_select { |x| x == arg }
    else
      return self.size
    end
    arr.length
  end

  def my_inject(args = 0)
    self.my_each do |el|
      args = yield(args, el)
    end
    args
  end
end
