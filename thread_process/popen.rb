

# f is an IO object passed to block
# this IO object is closed when the block exits
IO.popen('date') do | f |  
    puts "today is #{f.gets}"
end

