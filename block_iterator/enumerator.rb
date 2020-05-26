
# In Ruby, the basic iterator is internal to the collection — it’s simply a method,
# identical to any other, that happens to call yield whenever it generates a new value.
# For example, collection object .each method.
# What uses the iterator is just a block of code associated with a call to this method.
#
[1, 2, 3].each { |x| puts x * 2 }

# Most of the internal iterator methods - the ones that normally yield successive value
# to a block — will return an external iterator, aka Enumerator, object if called without
# a block:
enm = [1, 2, 3].each  # returns an enumerator object
puts enm.next  # call .next manually
begin
  while v = enm.next  # loop .next
    puts v * 10
  end
rescue StopIteration
  puts 'reached end'
end

# a more 'decent' way of looping iterator is by calling loop method,
# which takes care of end of iteration exception
# a ruby collection has to_enum method to generate an external iterator
enm2 = [1, 2, 3].to_enum
loop do |x|
  puts "showing next value: #{enm2.next}"
end
