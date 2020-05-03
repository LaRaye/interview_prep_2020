class Node
  attr_accessor :next, :value

  def initialize(value = nil)
    @value = value
    @next  = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def head=(node)
    if @head
      node.next = @head
      @head = node
    else
      @head = node
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end

    node = find_before(value)
    node.next = node.next.next
  end

  def find_before(value)
    node = @head
    return false if !node.next
    return node  if node.next.value == value

    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head
    while node
      puts node.value
      node = node.next
    end
  end
end


class Animal
  attr_accessor :timestamp

  def initialize
    self.timestamp = Time.now
  end

  def is_older?(animal)
    if self.timestamp < animal.timestamp
      return true
    else
      return false
    end
  end

end

class Dog < Animal
end

class Cat < Animal
end

class AnimalQueue

end
