

# closure is a piece of code that carries its creation context around with it
# a ruby block is a closure
# an objectized version of block, either a proc or lambda, is also a closure


class Cnter
  attr_reader :cnt

  def initialize
    @cnt = 100
  end

  # returns a Proc object constructed from a block
  def incre(delta)
    # this block has awareness of its defining scope context, including instance variable @cnt
    Proc.new { @cnt += delta }
  end

end

cnter = Cnter.new
puts "initial count: #{cnter.cnt}"

5.times do |idx|
  cnter.incre(idx).call
end
puts "count: #{cnter.cnt}"

# now reopen class and add another method
class Cnter

  # expects a block and converts it to a Proc object with '&' at runtime
  def incre2(&incre_blk)
    # at this moment incre_blk is a Proc thus 'call'able
    incre_blk.call(@cnt)
  end
end

ext_var = 'i am var outside of class'

# here we define a block outside of the class
# it is aware of its defining context including ext_var
cnter.incre2 { |cnt|
  puts cnt   # cnt is the copy of @cnt of cnter object
  # NOTE: block input argument is the copy of original object,
  # thus this does NOT change the cnter object instance variable @cnt
  cnt += 100
  puts "local count: #{cnt}"
  puts ext_var
}
puts "count: #{cnter.cnt}"


# use lambda method to convert block to proc
lmb = lambda { |x|
  puts "lambda input count: #{x}"
  x += 100
  puts "lambda return count: #{x}"

  # this is because this block is defined outside of the Cnter class
  # so it has no awareness of Cnter class context.
  # in order to change Cnter instance state we pass return value to caller
  x
}
puts "lambda class: #{lmb.class}"    # Proc class

# now reopen class and add another method
class Cnter
  # expects a callable object
  def incre3(proc)
    # we are adding another inline Proc to call the proc given as method argument
    Proc.new {   # this block has awareness of class context
      @cnt = proc.call(@cnt)
    }.call
  end
end

cnter.incre3(lmb)
puts "count: #{cnter.cnt}"   # show nil !

# this time we pass in a Proc object directly
cnter.incre3(Proc.new { |x|
  puts ext_var
  x + 100
})
puts "count: #{cnter.cnt}"



