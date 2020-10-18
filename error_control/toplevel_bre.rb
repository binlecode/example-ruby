# ruby has a special begin-rescue-end (BRE) error control layer
# that other languages don't have: top level, aka method definition level

# BRE can be defined right at method level
def safe_print(msg)
  raise Exception, 'this is a purposefully thrown error'

  puts "print message: #{msg}"
  true
rescue Exception => e
  puts "there was an error calling this method: #{e}"
  false
end

puts safe_print('ok')
