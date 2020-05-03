class Node
  attr_accessor :next, :value

  def initialize(value = nil)
    @value = value
    @next  = nil
  end
end

class LinkedList
  attr_reader :head, :tail

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

  def tail=(node)
    find_tail.next = node
    @tail = node
  end

  def find_tail
    node = @head
    return node if !node.next
    return node if !node.next while (node = node.next)
  end

  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def add(node)
    if @head
      find_tail.next = node
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
    self.timestamp = nil
  end

  def set_timestamp
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
  dog_list = LinkedList.new
  cat_list = LinkedList.new

  def enqueue(animal)
    if animal.is_a? Dog
      animal.set_timestamp
      dog_list.append(animal)
    elsif animal.is_a? Cat
      animal.set_timestamp
      cat_list.append(animal)
    end
  end

end
