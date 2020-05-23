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
    return if search(self.root, value)
    return Node.new(value) unless node

    if value < node.value
      node.left = insert(node.left, value)
    elsif value > node.value
      node.right = insert(node.right, value)
    end
  end

  def search(node, value)
    return nil if node == nil

    if value == node.value
      return node
    elsif value < node.value
      search(node.left, value)
    elsif value > node.value
      search(node.right, value)
    end
  end

  # def delete(value)
  #   node = search(self.root, value)
  #   if node != nil
  #     remove(node)
  #   end
  # end
  #
  # def remove(node)
  #   if node.left == nil && node.right == nil
  #     node = nil
  #   elsif node.left != nil && node.right == nil
  #     node = node.left
  #   elsif node.left == nil && node.right != nil
  #     node = node.right
  #   elsif node.left != nil && node.right != nil
  #     node = delete_with_2_children(node)
  #   end
  #
  #   node
  # end
  #
  # def delete_with_2_children(node)
  #   min_node = find_min_node(node.right)
  #   replace_value(min_node, node)
  #   remove_min_node(min_node)
  # end
  #
  # def find_min_node(node)
  #   if node.left == nil
  #     min_node = node
  #     return find_min_node
  #   else
  #     find_min_node(node.left)
  #   end
  # end
  #
  # def replace_value(min_node, node)
  #   node.value = min_node.value
  # end
  #
  # def remove_min_node(min_node)
  #   min_node = nil
  # end

end

###############################

def minimal_tree(arr)
  bst = BinarySearchTree.new(nil)
  bst.root = create_BST(arr, 0, arr.length - 1)
  bst
end

def create_BST(arr, starting, ending)
  return nil if (ending < starting)

  midpoint = (starting + ending) / 2
  node = Node.new(arr[midpoint])
  node.left = create_BST(arr, starting, midpoint - 1)
  node.right = create_BST(arr, midpoint + 1, ending)
  return node
end

def depths_lists(tree)
  node = tree.head
  depth = 0
  level_lists = []

  create_level_linkedlist(node, depth, levels)
  return levels
end

def create_level_linkedlist(node, depth, level_lists)
  return unless node

  if level_lists[depth]
    level_lists[depth].append(node)
  else
    list = LinkedList.new
    list.append(node)
    level_lists << list
  end

  create_level_linkedlist(node.left, depth + 1, level_lists) if node.left
  create_level_linkedlist(node.right, depth + 1, level_lists) if node.right
end
