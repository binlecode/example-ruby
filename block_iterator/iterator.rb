# a Ruby iterator is simply a method that can invoke a block of code

def my_iter
  yield
  yield
end

my_iter { puts 'I am called' }

# yield can pass parameter to the block

def my_iter2
  yield 'round 1'
  yield 'round 2'
end

my_iter2 { |msg| puts "I am called for #{msg}"}

# yield can collect return value from block
# The value of the last expression evaluated
# in the block is passed back to the method as the value of the yield
# do NOT use 'return' in block to return value, return statement
# will return the containing method where the block is defined (not called!)
#
# note that parentheses are used to force a yield call and evaluate its return
#
def my_iter3
  rtn = yield('hello there')
  puts "got echo from #{rtn}"
end

my_iter3 do |msg|
  puts "received message: #{msg}"
  'Jason'
end

# the bi-directional support of yield is great for repetitive processing, aka iteration
#
[1 , 2, 3].each { |x| puts x }

# let's define our own each method by opening Array class
class Array
  def my_each
    each do |blk|
      puts "evaluating element => #{yield(blk)}"
    end
  end
end

[1, 2, 3].my_each { |x| x * 10 }
