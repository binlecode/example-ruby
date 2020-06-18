
# wrap each client connection to a thread, so the server can receive
# requests from multiple clients at the same time
#

require 'socket'

server = TCPServer.new(9999)

while client_connection = server.accept
    Thread.start(client_connection) do |connection|
        while line = connection.gets
            break if line =~ /quit/ || line =~ /exit/
            puts line
            connection.puts "Received: #{line}"	
        end		
    
        connection.puts "Closing the connection #{connection}, bye!"
        connection.close
    end    
end
