class LinkedList

  class Node
    attr_accessor :next, :value

    def initialize(value = nil)
      @value = value
      @next  = nil
    end
  end

  attr_reader :head, :tail, :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def append(value)
    node = Node.new(value)

    unless @head
      @head = node
    else
      @tail.next = node
    end

    @tail = node
    @length += 1
  end

  def add(node)
    if @head
      find_tail.next = node
      @length += 1
    else
      @head = node
      @length += 1
    end
  end

  def head=(node)
    if @head
      node.next = @head
      @head = node
      @length += 1
    else
      @head = node
      @length += 1
    end
  end

  def append_after(target, value)
    node = find(target)
    return unless node
    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
    @length += 1
  end

  def find(value)
    node = @head
    return false if !node.next
    return node  if node.value == value
    while (node = node.next)
      return node if node.value == value
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      @length -= 1
      return
    end
    node = find_before(value)
    node.next = node.next.next
    @length -= 1
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
    while node != nil
      puts node.value
      node = node.next
    end
  end
end



#Given a directed graph, design an algorithm to find out
#whether there is a route between two nodes.

#     A
#   /  \
#  <    >
# B      C
#  \    /
#  <   >
#    D

def is_a_route?(graph, start_node, end_node)
  return true if start_node == end_node


end
