
#
# Unlike include, which applies to all the class's instance objects,
# extend is applied ONLY to the target object, be it either a
# normal instance object or a class object.
# When extend is on a normal instance object, the module methods are
# extended on the instance's singleton instance object, and not 
# shared with other instances of the same class.
# When extnd is on a class object, the module methods are 
# extended on the class objects singleton instance object, and are 
# ONLY shared among its class hierarchy (subclasses).
#
# Another way of viewing this is that extend() is a Kernel method; 
# object.extend(mod) adds the methods from mod as singleton methods 
# to any type of object. 
# Note that there is also a hook for it, just define 
# self.extended(base) in your module. A common usage of this hook is
# define a base.evaulate_class(self) do ... end closure to override a method
# in the target object because the method lookup goes from target object 
# to module.
#

module MyModule

  def hello_module
    puts 'instance hello method from MyModule'
  end

end


class MyClass

  attr_accessor :name, :color

  def to_s
    "#{self.class}: #{super}"
  end

end

mc = MyClass.new()
mc.name = 'my name'
mc.color = 'my color'
p mc # same as: puts mc.inspect

mc.extend(MyModule)
mc.hello_module

# this will raise NoMethodError exception
mc2 = MyClass.new()
begin
  mc2.hello_module
rescue Exception => e
  puts "rescued exception: #{e.inspect}"
end

# now we extend class's singleton instance object
class MyClass
  extend MyModule
end
# or can do this way:
# MyClass.extend MyModule

MyClass.hello_module

# this one will still break
begin
  mc2.hello_module
rescue Exception => e
  puts "rescued exception: #{e.inspect}"
end

# now see what's special about extending class instance object
class MySubClass < MyClass
end

# this won't raise exception !!!
# super class object mixed-in module is visible to sub class !!!
MySubClass.hello_module

p MySubClass.ancestors


# It is important to realize that modules are not mixed into anything
# by default, and that modules themselves are not directly related to
# the methods they define.

p MyModule.class    # MyModule is a Module class object

# and we know that any object can be mixed in module methods, we can do
# self mix in:
module MyModule
  # we use extend because Module has no instances so include makes no sense
  extend self   # same as: extend MyModule
end

# now MyModule class object has its own module methods
MyModule.hello_module

# self extension is a common design pattern in ruby for utility/function bags
# where logic doesn't rely on any persistent state




