class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    self.value = value
    self.left = nil
    self.right = nil
  end

end

class BinarySearchTree
  attr_accessor :root

  def initialize(value)
    self.root = Node.new(value)
  end

  def insert(node, value)
    return Node.new(value) unless node

    if value < node.value
      node.left = insert(node.left, value)
    elsif value > node.value
      node.right = insert(node.right, value)
    end
  end

end
