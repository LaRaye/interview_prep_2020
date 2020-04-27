class Stack
    class Node
        attr_accessor :next, :data
        def initialize data
            self.data = data
            self.next = nil
        end
    end

    attr_accessor :head, :tail, :length

    # Initialize an empty stack.
    # Complexity: O(1).
    def initialize
        self.head   = nil
        self.tail   = nil
        self.length = 0
    end

    # Inserts a new element into the stack.
    # Complexity O(1).
    def push data
        node = Node.new data
        if length == 0
            self.tail = node
        end

        node.next = self.head
        self.head = node
        self.length += 1
    end

    # Removes the element that's at the top of the stack.
    # Complexity O(1).
    def pop
        return nil unless self.length > 0

        self.head = self.head.next
        self.tail = nil if self.length == 1
        self.length -= 1
    end

    # Returns the element that's at the top of the stack without removing it.
    # Complexity O(1).
    def peek
        self.head
    end

    # Pops all elements from the stack.
    # Complexity O(n).
    def clear
        while peek
            pop
        end
    end

    # Enumerator (common ruby idiom).
    # Loops over the stack (from head to tail) yielding one item at a time.
    # Complexity: yield next element is O(1),
    #             yield all elements is O(n).
    def each
        return nil unless block_given?

        current = self.head
        while current
            yield current
            current = current.next
        end
    end

    # Prints the contents of the stack.
    # Complexity: O(n).
    def print
        if self.length == 0
            puts "empty"
        else
            self.each { |node| puts node.data }
        end
    end
end
