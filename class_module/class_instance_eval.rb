

# class_eval method's receiver is a class or a module, the block passed to class_eval
# is evaluated in the context of that class/module. 
# on the other hand, instance_eval's receiver is an instance, instance_eval evaluates 
# the code in the context of an instance instead of a class.
# note that a ruby instance can be either a normal instance or a class object.



class Person
end


Person.class_eval do
  	def say_hello
 		puts 'Hello!'
  	end
end

binle = Person.new
binle.say_hello     #=> "Hello!"

# instance_eval applied to instance object 

mike = Person.new
mike.instance_eval do 
	def is_mike?
		true
	end
end

puts mike.is_mike?


# instance_eval applied to class object

Person.instance_eval do
	def is_human?
		true
	end
end

puts Person.is_human?    #=> true

# the above is_human is a method of Person class object, aka a class method
# another way to define this method with better clairty is:

Person.class_eval do 
	def self.is_human?    # self is the class object itself since class_eval provides class context
		true
	end
end

puts Person.is_human?

