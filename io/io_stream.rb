

str = ''

str << 1 << 2 << " a tail"

puts str.dump  # => "\x01\x02 a tail"

