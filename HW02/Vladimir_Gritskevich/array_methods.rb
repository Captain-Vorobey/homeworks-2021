module ArrayMethods
  refine Array do
    def my_each
      for i in 0...self.size
        yield self[i]
      end
    end

    def my_map
      return unless block_given?

      new_arr = []
      for i in 0...self.length
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
