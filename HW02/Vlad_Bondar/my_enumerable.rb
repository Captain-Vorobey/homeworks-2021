module MyEnumerable
  refine Enumerable do
    def my_each
      for i in self 
        yield(i) if block_given?
      end
    end

    def my_map
      ms = []
      for i in self 
        ms << yield(i) if block_given?
      end
      ms
    end
  
    def my_select 
      ms = []
      for i in self 
        if block_given? && yield(i) == true
          ms << i 
        end
      end
      ms
    end
  end
end
