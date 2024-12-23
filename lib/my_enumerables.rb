module Enumerable
  # Your code goes here

  def my_each_with_index
    # self.each_with_index do |item, index|
    #   yield item, index
    # end
    # 
    count = 0
    self.each do |item|
      yield item, count
      count += 1
    end
  end

  def my_select
    arr = []
    self.each do |item|
      arr << item if yield item
    end
    arr
  end

  def my_all?
    bool = true
    self.each do |item|
      bool = bool && (yield item)
    end
    bool
  end

  def my_any?
    bool = false
    self.each do |item|
      bool = bool | (yield item)
    end
    bool
  end

  def my_none?
    bool = true
    self.each do |item|
      bool = bool && !(yield item)
    end
    bool
  end

  def my_count(arg = nil)
    count = 0
    if arg == nil && !block_given?
      self.each do |_|
        count += 1
      end
      return count
    elsif arg != nil
      self.each do |item|
        count +=1 if item == arg
      end
      return count
    elsif block_given?
      self.each do |item|
        count +=1 if yield item
      end
      return count
    end
  end

  def my_map
    if block_given?
      arr = []
      self.each do |item|
        arr << (yield item)
      end
    end
    arr
  end

  def my_inject(arg = 0)
    if block_given?
      acc = arg
      self.each do |item|
        acc = (yield acc, item)
      end
    end
    acc
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  # Define my_each here
  
  # def my_each
  #   self.each do |item|
  #     yield item
  #   end
  # end
  
  def my_each
    return to_enum unless block_given?
    
    for i in 0...length
      yield(self[i])
    end
    self
  end
end
