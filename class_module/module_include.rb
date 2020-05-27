
#
# Module provides code reuse with namespace separation.
# This type of code reuse doesn't consume class inheritance.
# It is called 'mixin', since module doesn't have instance, but gets
# mixed into target instance via 'include' keyword.
#
# The Ruby include statement simply makes a reference to a named module.
# If that module is in a separate file, you should use require (or
# its less commonly used cousin, load) to drag that file in before
# using include.
#
# The Ruby include does not simply copy the module’s instance methods
# into the class. Instead, it makes a reference from the class
# to the included module.
#
# Mixed in modules <em>effectively</em> behaves as superclasses.
#
#

module MyModule
  # available to target instance when included
  CONSTANT_VAR1 = 'ok, i am number 1'
  CONSTANT_VAR2 = 'ok, i am number 2'

  def hello_module
    puts 'instance hello method from MyModule'
  end

  def show_module_constants
    puts CONSTANT_VAR1
    puts CONSTANT_VAR2
  end

end


class MyClass
  include MyModule

  attr_accessor :name, :color

  def show_constants
    puts CONSTANT_VAR1
    puts CONSTANT_VAR2
  end

end

mc = MyClass.new()
mc.name = 'my name'
mc.color = 'my color'
p mc

mc.show_constants
mc.show_module_constants

# puts MyClass.ancestors.find_all { |ac| ac.class == Module }

puts mc.class.included_modules


# module also provides a callback at the event of being included

module MyModule
  def self.included(base)
    puts "i am included to class #{base}"

    def base.extra_class_method
      puts "extra class method from included module"
    end
  end

  def extra_instance_method
    puts "extra instance method from included module"
  end
end

class BaseClass
  include MyModule
end

BaseClass.extra_class_method

bc = BaseClass.new
bc.extra_instance_method
begin
  bc.extra_class_method
rescue => e
  puts e     # NoMethodError
end
