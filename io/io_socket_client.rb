
#
# make sure socket server is running before running this client
# 

require 'socket'

puts 'starting the client...'
client = TCPSocket.open("localhost", 9999)

client.write("hello\n")
client.write("quit\n")

# while msg = client.gets # read lines from socket
#     puts msg
# end
puts client.readlines # same as the while loop

client.close
