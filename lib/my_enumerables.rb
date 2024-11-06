module Enumerable
  def my_each_with_index
    if block_given?
      index = 0
      self.each do |item|
        yield(item,index)
        index += 1
      end
      return self
    end
  end

  def my_select
    result = []
    self.each do |item|
      if yield(item)
        result.push(item)
      end
    end
    return result
  end

  def my_all?
    self.each do |item|
      return false unless yield(item)
    end
    return true
  end

  def my_any?
    self.each do |item|
      return true if yield(item)
    end
    return false
  end

  def my_none?
    self.each do |item|
      return false if yield(item)
    end
    return true
  end

  def my_count
    count = 0
    self.each do |item|
      if block_given?
        if yield(item)
          count += 1
        end
      else
        count += 1
      end
    end
    return count
  end

  def my_map
    if block_given?
      new_arr = []
      self.each do |item|
        new_arr << yield(item)
      end
      return new_arr
    end
  end

  def my_inject(value)
    self.each do |item|
      value = yield(value, item)
    end
    return value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
# lib/my_enumerables.rb

class Array
  def my_each
    for item in self do 
      yield(item)
    end
  end
end