
#todo: the comments and snippets should be converted to a markdown post.
#
# The ability to define behavior on a per-object basis is
# one of the hallmarks of Ruby’s design. This is done via
# singleton class definition.
#
# Every object really has two classes:
#   1. The class of which it is an instance
#   2. Its singleton class
# Singleton class methods are ONLY available to the singleton
# class's owning instance which can be either normal instance
# or class instance.
#
# Singleton classes are anonymous, denoted by '<<' followed by
# an object name.

# let's say we have a simple class as below:
class MyClass
  attr_accessor :name, :color
end

mc = MyClass.new()
mc.name = 'my name'
mc.color = 'my color'
p mc

# '<< mc' is the anonymous, singleton class of object mc
class << mc

  # this is only available to mc instance !
  def mc_hello
    puts 'hello from mc instance'
  end

end

mc.mc_hello

# this will blow on another MyClass instance object
begin
  MyClass.new().mc_hello
rescue Exception => e
  puts "exception: #{e.inspect}"
end

# another way of defining singleton class method
def mc.mc_hello2
  puts "hello2 from mc instance"
end

mc.mc_hello2

# Basically 'class << ...' technique is general: it puts you
# in a definition block for the singleton class of an instance object,
# whether the instance being normal object or class object.

# now we reopen MyClass class and add some more methods.

class MyClass

  class << self    # here self is MyClass class object
    def my_class_hello
      puts 'i am a class hello method'
    end
  end

  def self.my_class_hi    # here self is class object
    puts 'i am a class hi method'
  end

  def instance_hello
    puts 'i am an instance hello method'
  end

  def hello
    puts 'instance hello'
  end

end

MyClass.my_class_hello


#
# An object’s singleton class comes first in the method lookup path.
# The singleton class is the object’s personal method-storage area,
# so it takes precedence. After the singleton class come any modules
# mixed into it. Next comes the object’s original class, and so forth.
#

mc.hello   # puts 'instance hello'

module HelloModule
  def hello
    puts 'module hello'
  end
end

class MyClass
  include HelloModule
end

mc.hello   # still puts 'instance hello' since this is a class level mixin

module HelloSingletonModule
  def hello
    puts 'singleton module hello'
  end
end

class << mc  # include to mc's singleton class
  include HelloSingletonModule
end
# or extend direct on the instance
# mc.extend HelloSingletonModule
mc.hello   # puts 'singleton module hello' since this is a singleton mixin

def mc.hello
  puts 'singleton hello'
end

mc.hello # puts 'singleton hello'  since this is direct singleton method

# as a summary, the look up path:
# 1) Methods defined in the object’s singleton class (i.e. the object itself)
# 2) Modules mixed into the singleton class in reverse order of inclusion
# 3) Methods defined by the object’s class
# 4) Modules included into the object’s class in reverse order of inclusion
# 5) Methods defined by the object’s superclass.
#
# see link: http://blog.rubybestpractices.com/posts/gregory/030-issue-1-method-lookup.html

#
# Ruby's class methods are truly object oriented, because they ultimately
# belong to an object (classes are objects).
# Note: this is largely different from other objected oriented languages
# such as C++/Java, which are really class oriented.
#
# In an object-oriented language, objects are defined by defining objects
# rather than classes, although classes can provide some useful templates
# for specific, cookie-cutter definitions of a given abstraction.
# In a class-oriented language, like C# or Java, objects must be defined by
# classes, and these templates are usually canned and packaged and made
# immutable before runtime. This arbitrary constraint that objects must be
# defined before runtime and that the definitions of objects are immutable
# is not an object-oriented concept: it's class oriented.
#

mc = MyClass.new
mc.instance_hello
begin
  mc.my_class_hello
rescue => e
  p e  # NoMethodError, since class methods belong to class's singleton class
end

# this is explicitly using class's singleton class to define class methods
class << MyClass
  def my_class_hi2
    puts 'i am a class hi method too'
  end
end

MyClass.my_class_hi2

# another way to define class method, but with static class name
def MyClass.my_class_hello2
  puts 'i am another class instance hello method'
end
MyClass.my_class_hello2

# NOTE: class methods are available to sub classes !
class MySubClass < MyClass
end

MySubClass.my_class_hello
MySubClass.my_class_hi
MySubClass.my_class_hi2
MySubClass.my_class_hello2









