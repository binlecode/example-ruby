


var1 = 'value 1'


# keep in mind that a code block is NOT an object

# to define a method takes a block as input, '&' should be pre-fixed to 
# to the last argument as the expected block
# '&' creates an invisible Proc object with the block at runtime

# here is a simple block to Proc object converter
def blk_to_prc(&blk) # expecting a block and convert to a Proc and store back into blk
  blk  # here blk is already a Proc object to be returned
end

# the api below means 'call_block' method can take a block as the last argument
# note that the block argument is always optional and can be checked 
# at method calling time
def call_block(params, &block)

  puts "call_block => got params: #{params.inspect}"
  if block_given?
    puts "received a block arg, calling it"
    # yield params
    block.call params
    puts "block call complete"
  else
    puts "no block given"
  end

end


# example of calling anonymous block
call_block({:key_a => 'value a'}) do |params|

  puts "instance scope var1: #{var1}"
  puts "the block received params: #{params.inspect}"

end
# no block given in this call
call_block({})


# define a Proc object with a code block
pr = Proc.new do |params|
  puts "proc received params: #{params.inspect}"
end
# a Proc object can receive 'call' message
pr.call({:key1 => 'val1'})


# Proc object can server as code block
# here '&' pre-fixing a Proc object as a reverse conversion to
# use Proc object as code block
# call_block({:someKey => 'some value'}, &pr)
call_block({:someKey => 'some value'}, &pr)

# Note that, in the example above, since pr is a Proc object, it is
# passed as method argument, but will be used as code block. And
# because of that, no explicit block can be attached further.
# This following will cause syntax error: both block arg and actual block given
# call_block({}, &pr) { puts 'can not attach block here'}


# '&' before a block is converting it to a Proc object
# when '&' is before an object, it is actually sending a 'to_proc' message
# to the object. This can be used to make a normal object to be called as a Proc object
# the below example makes the Abc class object a callable object
class Abc
  def self.to_proc
    Proc.new do |str|
      puts "print input of the proc: #{str}"
    end
  end
end
# now String class works as Proc
call_block('hello proc', &Abc)

# this time the to_proc is defined on an instance object (as its singleton method)
abc = Abc.new
def abc.to_proc
  Proc.new do |arg|
    puts "abc singleton proc is called with input: #{arg}"
  end
end 
call_block('hello abc', &abc)


# Symbol#to_proc is designed the same way
# :capitalize!.to_proc is called internally
puts %w{sky star moon}.each(&:capitalize!)
# the same as:
puts %w{sky star moon}.each { |str| str.capitalize! }
# you can also do:
# puts %w( really cool ).each (&('capitalize!'.to_sym))
# and:
proc_name = 'capitalize!'
puts %w( really crazy ).each &(proc_name.to_sym)




