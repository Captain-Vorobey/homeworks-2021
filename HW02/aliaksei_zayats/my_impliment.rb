module CustomArrayMethods
  refine Array do
    def my_map
      return_arr = []
      length.times do |i|
        return_arr[i] = yield(self[i])
      end
      return_arr
    end

    def my_select
      return_arr = []
      length.times do |i|
        return_arr << self[i] if yield(self[i])
      end
      return_arr
    end

    def my_each
      length.times do |i|
        yield(self[i])
      end
    end

  end
end
