
# a simple fibonacci array demo with multi-assignment
#
a, b = 0, 1
while a < 50
  puts a
  a, b = b, a + b
end

# fibo generator
#
fibo_gen = Enumerator.new do |yielder|
  a, b = 0, 1
  loop do
    yielder.yield a
    a, b = b, a + b
  end
end
puts 'first 10 of fibonacci numbers generated:'
puts fibo_gen.first(10)
