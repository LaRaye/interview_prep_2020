class Animal
  attr_accessor :timestamp

  def initialize
    self.timestamp = Time.now
  end

  def is_older?(animal)
    if self.timestamp < animal.timestamp
      return true
    else
      return false
    end
  end

end

class Dog < Animal
end

class Cat < Animal
end

class AnimalQueue

end
