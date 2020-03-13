module Enumerable
  def my_each
    for ele in self do
      yield(ele)
    end
  end

  def my_each_with_index
    index = 0
    for ele in self do
      yield(ele, index)
      index += 1
    end
  end
  
  def my_select
    result = []
    for ele in self do
      if yield(ele)
        result << ele
      end
    end
    result.inspect
  end

  def my_all?
    for ele in self do
      if !yield(ele)
        return false
      end
    end
    true
  end

  def my_any?
    for ele in self do
      if yield(ele)
        return true
      end
    end
    false
  end

  def my_none?
    for ele in self do
      if yield(ele)
        return false
      end
    end
    true
  end

  def my_count 
    self.length
  end

  # def my_map
  #   result = []
  #   for ele in self do
  #     result << yield(ele)
  #   end  
  #   result.inspect
  # end

  def my_map proc=nil
    result = []

    if block_given?
      for ele in self do
        result << yield(ele)
      end
    
    elsif proc
      result << proc.call(ele)
    end

    result.inspect
  end

  def my_inject(init=nil)
    if init
      result = init
      start_index = 0
    else
      result = self.first
      start_index = 1
    end

    self[start_index..(self.length-1)].my_each do |ele|
      result = yield(result, ele)
    end
    result
  end
end

def multiply_els(arr)
  arr.my_inject { |prod, num| prod * num }
end

my_array = [1,5,9,10,12,0,0,0,0,1]

# puts my_array.my_each { |num| puts "Current number is #{num}" }
# puts my_array.my_each_with_index{ |n, i| puts "Index #{i} is #{n}" }
# puts my_array.my_select { |num| num > 3 }
# puts my_array.my_all? { |num| num > 3 }
# puts my_array.my_any? { |num| num > 30 }
# puts my_array.my_none? { |num| num > 30 }
# puts my_array.my_count
# puts my_array.my_map { |num| num ** 2 }
# puts my_array.my_inject { |total, ele| total + ele }
# puts my_array.inject { |total, ele| total + ele }
# puts multiply_els([2,5,6,7])

square = Proc.new {|x| x**2 }
puts my_array.my_map square