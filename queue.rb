class Queue
    class Node
        attr_accessor :next, :data
        def initialize data
            self.data = data
            self.next = nil
        end
    end

    attr_accessor :head, :tail, :length

    # Initialize an empty queue.
    # Complexity: O(1).
    def initialize
        self.head   = nil
        self.tail   = nil
        self.length = 0
    end

    # Inserts a new element into the queue.
    # Complexity O(1).
    def enqueue data
        node = Node.new data
        unless head
            self.head = node
        else
            self.tail.next = node
        end
        self.tail    = node
        self.length += 1
    end

    # Removes the first element from the queue.
    # Complexity O(1).
    def dequeue
        return nil unless self.length > 0
        self.head = self.head.next
        self.tail = nil if self.length == 1
        self.length -= 1
    end

    # Returns the first element in the queue without dequeing it.
    # Complexity O(1).
    def peek
        self.head
    end

    # Dequeues all elements from the queue.
    # Complexity O(n).
    def clear
        while peek
            dequeue
        end
    end

    # Enumerator (common ruby idiom).
    # Loops over the queue (from head to tail) yielding one item at a time.
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

    # Prints the contents of the queue.
    # Complexity: O(n).
    def print
        if self.length == 0
            puts "empty"
        else
            self.each { |node| puts node.data }
        end
    end
end
