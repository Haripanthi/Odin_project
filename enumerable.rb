#This project is for Odin project
#trying to create own enumerable methods

module Enumerable
  def my_each
    for i in self
    yield(i)
    end
  end
  
  def my_each_with_index
    for i in 0...length
    yield(self[i], i) 
    end
  end
  
  def my_select
    arr = []
   self.my_each{|i| arr << i if yield(i)}
   return arr
  end
 
 def my_all?
   if block_given?
     self.my_each{|i| return true if yield(i)}
   else 
     return true
   end
   return false
 end
 
 def my_none?
   self.my_each{|i| return false if yield(i)}
   return true
 end
 
 def my_count(num = nil)
   result = 0
   if block_given?
     self.my_each{|i| result +=1 if yield(i)}
     elsif (num != nil)
     self.my_each{|i| result +=1 if num == 1}
   else
     self.my_each{|i| result +=1}
   end
   result
 end
 
 # def my_map block
#   arr = []
#   self.my_each{|i| arr << yield(i)}
#   arr
# end

  def my_inject (arg)
    a = arg
      self.my_each{|e| a = yield(a,e)}
    a
  end


  def my_map block = nil
    arr = []
    if block != nil
      self.my_each{|i| arr << proc.call(i)}
    else 
      self.my_each{|i| arr << yield(i)}
    end
    arr
  end

end

def multiply_els (arg)
  return arg.my_inject(1){|acc, elem| acc*elem}
end