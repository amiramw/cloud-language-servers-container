require 'socket'

clientIn = TCPSocket.new 'localhost', ENV['STDOUT_PORT']
clientOut = TCPSocket.new 'localhost', ENV['STDIN_PORT']

puts "Connection is opened"
readyMsg = "Content-Length: 60\r\n\r\n" + 
           "{\r\n\t\"jsonrpc\": \"2.0\",\"id\": \"1\",\"method\": \"protocol/Ready\"\r\n}"
clientOut.send readyMsg, 0

while  msg = clientIn.recv( 1024 )  do # Read message from socket
  puts msg
  clientOut.send msg, 0
end

#puts "EOF........"
#clientIn.close             # close socket when done
#clientOut.close  
  