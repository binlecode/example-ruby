
# First, write an iterator called each, which returns the elements of your
# collection in turn.
# Then, mix in Enumerable , and suddenly your class supports things such as
# map, include?, and find_all?.
# If the objects in your collection implement meaningful ordering semantics
# using the <=> method, you’ll also get methods such as min, max, and sort.
#

class MyFibo
  include Enumerable

  def initialize(max)
    @max = max
  end

  def each
    a, b = 0, 1
    while a <= @max do
      yield a
      a, b = b, a + b
    end
  end

end

mf = MyFibo.new(100)

puts "total count: #{mf.count}"
puts 'even numbers:'
puts mf.find_all { |x| x % 2 == 0 }
puts mf.include? 12   # => false

