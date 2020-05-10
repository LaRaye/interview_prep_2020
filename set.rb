require_relative "./linked_list.rb"

class Set

	# Set's constructor.
	def initialize
		@list = LinkedList.new
	end

	# Inserts a member into the current set.
	# Complexity O(n)
	def insert member
		return if contains? member
		@list.insert member
	end

	# Removes a member from the current set.
	# Complexity O(n)
	def remove member
		node = @list.find_first { |nd| nd.data == member }
		@list.remove node if node
	end

	# Returns a set that contains all members of the current set and the set.
	# Complexity O(mn)
	def union other
		res = Set.new
		# Copy elements from current set.
		# (Remember that insert does nothing if
		# the member already exists.)
		@list.each { |nd| res.insert(nd.data) }

		# Copy elements from the other set.
		other.each { |nd| res.insert(nd.data) }
		res
	end

	# Returns the intersection of the current set with other set.
	# Complexity O(mn)
	def intersect other
		res = Set.new
		@list.each do |nd|
			res.insert(nd.data) if other.contains?(nd.data)
		end
		res
	end

	# Returns the difference between the current set and other set.
	# Complexity O(mn)
	def diff other
		res = Set.new
		@list.each do |nd|
			res.insert(nd.data) unless other.contains?(nd.data)
		end
		res
	end

	# Returns true if the current set contains member
	# and false otherwise.
	# Complexity O(n)
	def contains? member
		@list.find_first { |nd| nd.data == member }
	end

	# Returns true is the current set is a subset of other set
	# and false otherwise.
	def subset? other
		# Fast check.
		return false if self.count > other.count

		# Slow check.
		@list.each do |nd|
			return false unless other.contains(nd.data)
		end
		true
	end

	# Returns true is the current set is equal to other set
	# and false otherwise.
	def equal? other
		# Fast check.
		return false if self.count > other.count

		# Slow check.
		subset? other
	end

	def count
		@list.length
	end

	def each
		return nil unless block_given?

		current = @list.head
		while current
			yield current
			current = current.next
		end
	end

	def print
		@list.print
	end
end
