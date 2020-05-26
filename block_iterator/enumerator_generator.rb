
# enumerators are generators
# a generator yields a value to caller one at a time
#
even_nmb_gen = Enumerator.new do |yielder|
  seed = 0
  # note this is an endless loop, but iterate once a time when .next is called
  loop do
    seed += 1
    yielder.yield seed * 2
  end
end

# call generator 5 times
5.times { puts even_nmb_gen.next }
# use the generator helper method .first
puts even_nmb_gen.first(5)

# create a higher-order generator function that takes in a generator and a filter block,
# and returns a generator
#
def filter_gen(num_gen, &filter)
  fltr_gen = Enumerator.new do |yielder|
    num_gen.each do |value|
      yielder.yield(value) if filter.call(value)
    end
  end
  return fltr_gen
end

# create a times-4 filter applied to the even number generator
#
filter_times4_gen = filter_gen(even_nmb_gen) do |value|
  value % 4 == 0
end

# enumerator generators have common stream helper methods,
# such as select, reject, map, etc
#
# we can also define free-standing procs as filters to be used
# in the stream processing
#
filter_smaller_than_10 = -> x { x < 10 }
#
puts 'streaming first 3 times-4 numbers:'
# note .lazy enables lazy enumeration to avoid potential infinite array
# lazy enumeration enables us build complex filter chain
#
puts filter_times4_gen.lazy
         .reject(&filter_smaller_than_10)
         .select { |x| x % 4 == 0 }
         .first(3)
         .map { |x| x * 10 }

