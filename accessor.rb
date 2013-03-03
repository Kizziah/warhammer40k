class Person
  attr_accessor :age
  ...
end

# Here, I can see that I may both read and write the age.

class Person
  attr_reader :age
  ...
end

# Here, I can see that I may only read the age. Imagine that it is set by the constructor of this class and after that remains constant. If there were a mutator (writer) for age and the class were written assuming that age, once set, does not change, then a bug could result from code calling that mutator.

# But what is happening behind the scenes?

# If you write:

attr_writer :age

# That gets translated into:

def age=(value)
  @age = value
end

# If you write:

attr_reader :age

# That gets translated into:

def age
  @age
end

# If you write:

attr_accessor :age

# That gets translated into:

def age=(value)
  @age = value
end

def age
  @age
end