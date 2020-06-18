require 'webrick'

include WEBrick


myserver = HTTPServer.new(:Port => 13000, :DocumentRoot => Dir.pwd)


trap("INT") { myserver.shutdown }
myserver.start
