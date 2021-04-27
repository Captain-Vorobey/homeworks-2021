module ArrayMethods
  refine Array do

    def my_map
      if block_given?
        ret_array = []
        for i in 0...self.size
          ret_array << yield(self[i])
        end
        ret_array
      end
    end

    def my_select
      if block_given?
        ret_array = []
        for i in 0...self.size
          ret_array << self[i] if yield(self[i])
        end
        ret_array
      end
    end

    def my_each
      if block_given?
        for i in 0...self.size
          yield(self[i])
        end
        self
      end
    end

  end
end
