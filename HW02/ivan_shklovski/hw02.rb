module NewArrayMethods
  refine Array do
    def my_each
      for i in 0...size
        yield(self[i])
      end
    end

    def my_map
      new_arr = []
      for i in 0...size
        new_arr << yield(self[i])
      end
      new_arr
    end

    def my_select
      new_arr = []
      for i in 0...size
        new_arr << self[i] if yield(self[i])
      end
      new_arr
    end
  end
end