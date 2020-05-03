##################################
#Animal Shelter

class Node
  attr_accessor :next, :value

  def initialize(value = nil)
    @value = value
    @next  = nil
  end
end

class Queue
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
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
    @tail.next = node
    @tail = node
  end

  def peek
    @head
  end

  def pop
    if @head
      @head = @head.next
    end
  end

  def push(value)
    node = Node.new(value)

    unless @head
      @head = node
    else
      @tail.next = node
    end

    @tail = node
  end

  def print
    node = @head
    while node != nil
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
  @@dog_list = Queue.new
  @@cat_list = Queue.new

  def enqueue(animal)
    if animal.is_a? Dog
      animal.set_timestamp
      @@dog_list.push(animal)
    elsif animal.is_a? Cat
      animal.set_timestamp
      @@cat_list.push(animal)
    end
  end

  def dequeue_any
    first_cat = @@cat_list.peek
    first_dog = @@dog_list.peek

    unless first_cat == nil || first_dog == nil
      if first_cat.value.is_older?(first_dog.value)
        dequeue_cat
      else
        dequeue_dog
      end
    end

    if first_cat && !first_dog
      dequeue_cat
    elsif first_dog && !first_cat
      dequeue_dog
    else
      return nil
    end
  end

  def dequeue_dog
    @@dog_list.pop
  end

  def dequeue_cat
    @@cat_list.pop
  end

  def print_cats
    @@cat_list.print
  end

  def print_dogs
    @@dog_list.print
  end
end
