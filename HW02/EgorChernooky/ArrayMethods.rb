module ArrayMethods
  refine Array do

    def my_each
      length.times do |i|
        yield(self[i])
      end
    end
    
    def my_map
      return_array = []
      length.times do |i|
        return_array[i] = yield(self[i])
      end
      return_array
    end
    
    def my_map!
      length.times do |i|
        self[i] = yield(self[i])
      end
      self
    end
    
    def my_select
      return_array = []
      length.times do |i|
        return_array << self[i] if yield(self[i])
      end
      return_array
    end
    
    def my_empty?
      length.zero? ? true : false
    end
    
    def my_reverse
      return_array = Array.new(length)
      length.times do |i|
        return_array[-1 - i] = self[i]
      end
      return_array
    end
    
    def my_reverse!
      array = Array.new(length)
      length.times do |i|
        array[-1 - i] = self[i]
      end
      length.times do |i|
        self[i] = array[i]
      end
      self
    end
  end
end
