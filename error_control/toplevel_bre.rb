
# ruby has a special begin-rescue-end (BRE) error control layer
# that other languages don't have: top level, aka method definition level

# BRE can be defined right at method level
def safe_print(msg)
    raise Exception.new 'this is a purposefully thrown error'

    puts "print message: #{msg}"
    return true
rescue Exception => ex
    puts "there was an error calling this method: #{ex}"
    return false
end

puts safe_print('ok')