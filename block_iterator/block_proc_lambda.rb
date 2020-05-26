# block_proc_lambda.rb

# we can define Proc objects in two ways
# - use Proc.new with a block
# - use lambda function with a block

# a Proc object created this way is called proc
pr = Proc.new { puts 'hello proc' }

# proc method is a synonym of Proc.new
prc = proc { puts 'hello proc' }
prc.call

# use lambda method to create a lambda, a Proc object as well
lbd = lambda { puts 'hello lambda' }
lbd.call

# proc and lambda are not methods, they are Proc objects that are callable
# with a 'call' method
# The arguments you pass to the call method become arguments to the block, 
# and the return value of the block becomes the return value of the call method


# since Ruby 1.9, there's a literal shortcut for lambda
lbd = lambda do |x, y = 2|
	puts "got input: #{x}, #{y}"
end
# can be rewritten as
lbd = ->(x, y = 2) { puts "got input: #{x}, #{y}" }

lbd.call 'hello lambda'

# we can get arity from a Proc object
puts lbd.arity

# the difference between proc and lambda is that
# procs behave like block, while lambdas behaves like methods (functions)
# the concept of lambda comes from functional programming anyway


