require_relative "./linked_list.rb"
require_relative "./set.rb"
require_relative "./queue.rb"

class LinkedList
  def remove_next(prev_node)
    return nil unless self.length > 0

    unless prev_node
      self.head = self.head.next
    else
      if prev_node.next == prev_node
        self.head = nil
      else
        old = prev_node.next
        prev_node.next = prev_node.next.next

        if (old == self.head)
          self.head = old.next
        end
      end
    end

    self.length -= 1
  end

  def find_vertex(key)
    node = @head
    if !node || !node.next
      return nil
    end
    return node.value if node.value.key == key
    while (node = node.next)
      return node.value if node.value.key == key
    end
  end

  def print_vertices
    node = @head
    while node != nil
      puts "#{node.value.key} (vertex)"
      node.value.edges.each {|e| puts "  #{e.key} (edge)"}
      node = node.next
    end
  end
end

class Graph
  class Vertex
    attr_accessor :key, :edges

    def initialize(key)
      self.key = key
      self.edges = Set.new
    end
  end

  def initialize
    @vertices = LinkedList.new
  end

  def find_vertex(key)
    @vertices.find_vertex(key)
  end

  def insert_vertex(key)
    return if find_vertex(key)
    vertex = Vertex.new(key)
    @vertices.append(vertex)
  end

  def insert_edge(key1, key2)
    v1 = find_vertex(key1)
    return unless v1

    v2 = find_vertex(key2)
    return unless v2

    v1.edges.insert(v2)
  end

  def remove_vertex(key)
    found = false
    target = nil
    prev = nil

    @vertices.each do |v|
      return if v.value.edges.contains?(key)

      if v.value.key == key
        found = true
        target = v.value
      end

      prev = v unless found
    end

    return unless found
    return unless target.edges.length == 0
    @vertices.remove_next(prev)
  end

  def remove_vertex(key)
    found = false
    target = nil
    prev = nil

    node = @vertices.head
    while node != nil
      return if node.value.edges.contains?(find_vertex(key))

      if node.value.key == key
        found = true
        target = node.value
      end

      prev = node unless found
      node = node.next
    end

    return unless found
    return unless target.edges.length == 0
    @vertices.remove_next(prev)
  end

  def adjacent?(key1, key2)
    vertex = find_vertex(key1)
    return true if vertex.edges.contains?(find_vertex(key2))
    return false
  end

  def print
    @vertices.print_vertices
  end
end

#Given a directed graph, design an algorithm to find out
#whether there is a route between two nodes.

#          1
#        /    \
#       <      >
#      2        3
#    /   \
#   <     >
#  4      5

def is_a_route?(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

  node_queue = Queue.new
  node_queue.enqueue(start_vertex)

  while (node_queue.length != 0)
    current_node = node_queue.peek.value
    node_queue.dequeue

    if current_node == end_vertex
      return true
    else
      current_node.edges.each do |e|
        node_queue.enqueue(e.value)
      end
    end
  end

  return false
end
