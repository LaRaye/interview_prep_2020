class LinkedList
  def initialize
    @head = nil
  end
  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end
  def find_tail
    node = @head
    return node if !node.next
    return node if !node.next while (node = node.next)
  end
  def append_after(target, value)
    node           = find(target)
    return unless node
    old_next       = node.next
    node.next      = Node.new(value)
    node.next.next = old_next
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
      return
    end
    node      = find_before(value)
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
    puts node
    while (node = node.next)
      puts node
    end
  end
end

class Node
  attr_accessor :next
  attr_reader   :value
  def initialize(value)
    @value = value
    @next  = nil
  end
  def to_s
    "Node with value: #{@value}"
  end
end
#########################

def remove_dupes(linked_list)
  current_node = linked_list.head
  previous_node = nil
  node_set = Set[]

  while current_node.next != nil
    if !node_set.include?(current_node.value)
      node_set << current_node.value
      previous_node = current_node
      current_node = current_node.next
    else
      unless current_node.value == previous_node.value
        current_node = previous_node.next.next
        previous_node.next = current_node
      else
        current_node = current_node.next
        previous_node.next = current_node
      end
    end
  end

  return linked_list
end

###############################

# k = 3
# 1 => 2 => 3 => 4 => [5] => 6 => 7

def find_kth_to_last(linked_list, k)
  pointer_1 = linked_list.head
  pointer_2 = linked_list.head
  counter = 1

  while pointer_1.next != nil

    if counter != k
      counter += 1
      pointer_1 = pointer_1.next
    else
      pointer_1 = pointer_1.next
      pointer_2 = pointer_2.next
    end
  end

  return pointer_2.value
end

################################

# Input: 1->4->3->2->5->2, x = 3
# Output: 1->2->2->4->3->5

def partition(linked_list, x)
  current_node = linked_list.head

  while current_node.next != nil


  end
end
