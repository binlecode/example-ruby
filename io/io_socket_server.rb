
#
# run `io_socket_server.rb` to start server, 
# then run `io_socket_client.rb` to connect to it.
#


require 'socket'

server = TCPServer.new(9999)

while connection = server.accept
	while line = connection.gets
		break if line =~ /quit/ || line =~ /exit/
		puts line
		connection.puts "Received!"	
	end		

	connection.puts "Closing the connection, bye!"
	connection.close
end


