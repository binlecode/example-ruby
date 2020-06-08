
# Ruby defines a single base class, IO , to handle input and output.
# An IO object is a bidirectional channel between a Ruby program and some external
# resource.


f = File.open 'io_file.rb'
begin
    f.readlines.each do |line|
        puts line
    end          
rescue => exception
    raise exception
ensure
    f.close    
end
    
# resource auto close
File.open('io_file.rb', 'r') do |f|
    f.each_line do |ln|
        puts "line content: #{ln.dump}"  # String#dump shows new-line as well
    end
end

# renaming files under a folder
d = Dir.open '.'
d.each do |fname|
  puts fname #  File.basename(fname)
  if fname =~ /^test/
    puts 'need rename to ' + fname.sub(/^test/, 'eg_')
    File.rename(fname, fname.sub(/^test/, 'eg_'))
  end
end


# File.open('test_console_input.log', 'w') do |f|
#     until (instr = $stdin.gets) =~ /end/i do
#         $stdout.puts "got string: #{instr}"
#         f.puts instr
#     end
#     $stdout.puts 'end of input'
# end

