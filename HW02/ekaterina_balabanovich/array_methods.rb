module ArrayMethods
  refine Array do
    def my_map
      return unless block_given?

      new_arr = []
      for i in 0...self.length
        new_arr << yield(self[i])
      end
      new_arr
    end

    def my_select
      return unless block_given?

      new_arr = []
      for i in 0...self.length
        new_arr << self[i] if yield(self[i])
      end
      new_arr
    end

    def my_each
      return unless block_given?

      for i in 0...self.length
        yield(self[i])
      end
      self
    end
  end
end