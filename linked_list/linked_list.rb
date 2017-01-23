require './node.rb'

class LinkedList
  
  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end
  
  def prepend(node)
    node.next_node = @head
    @head = node
    if @tail == nil
      @tail = node
    end
    @count +=1
  end
  
  
  def append(node)
    if @tail == nil
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    count +=1
  end
  
  
  def size
    return @count
  end
  
  
  def head
    return @head
  end
  
  
  def tail
    return @tail
  end
  
  
  def at(index)
    current_node = @head
    count = 0
    
    while count !=index
    current_node = current_node.next_node
    count +=1
    end
    
    return current_node.value
  end
  
  
  def pop
    current_node = @head
    while current_node.next_node != @tail
    current_node = current_node.next_node
    end
  
    current_node.next_node = nil
    @count -=1
  end


  def contains?(data)
    current_node = @head
    while current_node !=nil
      if current_node.value == data
        return true
      end
      current_node = current_node.next_node
    end
    return false
  end
  
  
  def find(data)
    count = 0
    current_node = @head
    while current_node != nil
      if current_node.value == data
        return count
      end
      count +=1
      current_node = current_node.next_node
    end
    return nil
  end
  
  
  def to_s
    current_node = @head
    string = ""
    while current_node != nil
      string +="( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string +="nil"
    return string
  end
  
end
