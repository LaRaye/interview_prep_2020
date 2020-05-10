class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
    @left  = nil
    @right = nil
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
