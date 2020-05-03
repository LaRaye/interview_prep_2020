################################################
#Stack of Plates
class Node
  attr_accessor :next, :data

  def initialize(data)
    self.data = data
    self.next = nil
  end
end


class Stack
  attr_accessor :head, :tail, :length

  def initialize
    self.head = nil
    self.tail = nil
    self.length = 0
  end

  def push(data)
    node = Node.new(data)

    if length == 0
      self.tail = node
    end

    node.next = self.head
    self.head = node
    self.length += 1
  end


  def pop
    return nil unless self.length > 0

    self.head = self.head.next
    self.tail = nil if self.length == 1
    self.length -= 1
  end

  def peek
    self.head
  end

  def clear
    while peek
      pop
    end
  end

end


class SetOfStacks



end



################################################
