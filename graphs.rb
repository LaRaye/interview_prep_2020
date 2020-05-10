require_relative "./linked_list.rb"
require_relative "./set.rb"

class Graph
  class Vertex
    attr_accessor :key, :edges

    def initialize(key)
      self.key = key
      self.edges = Set.new
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
