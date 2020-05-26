

# block is defined in two ways: do/end or a pair of braces
# braces pair typically make things a bit tighter and, more
# importantly, braces have a higher precedence than do/end.
#
# this displays [2, 4, 6] because {} takes precedence over puts
puts [1, 2, 3].map { |x| x * 2 }

# this displays [1, 2, 3] because puts takes precedence over the do/end block
puts [1, 2, 3].map do |x|
  x * 2
end


# block does not stand alone, it can only follow a method invocation
# when a method is called with a block, it can ignore it, or use 'yield'
# to invoke the block
#
# yield is used in methods that accept block as input argument
def call_block
  yield
end

call_block do
  puts 'i am a happy block'
end

# when the method has yield, it expects a block
begin
  call_block
rescue => e
  puts e     # LocalJumpError: no block given
end

# or it can check if a block is given or not
def check_and_call_block
  if block_given?  # this method is included from kernel module
    yield
    yield   # simply repeats the block execution
    3.times { yield }
  else
    puts 'no block given :('
  end
end

check_and_call_block { puts 'i am a block' }
check_and_call_block


# you should not normally use the return keyword to return from a block. 
# A return inside a block causes the containing method (not the method 
# that yields to the block, but the method that the block is part of) 
# to return. 
# Don't use return if you just want to return from a block to the method 
# that called yield. If you need to force a block to return to the invoking 
# method before it reaches the last expression, or if you want to return 
# more than one value, you can use next instead of return.

# in other words, next is the 'return' from the block back to the yielding method

5.times do |idx|
  if idx.even?
    puts "skipping even number: #{idx}" 
    next
  end

  puts "the number is #{idx}"
end
