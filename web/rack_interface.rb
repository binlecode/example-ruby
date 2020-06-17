# install rack gem programmtically
require_relative '../gem_installer'
find_or_install('rack')

# load rack gem after it is installed
require 'rubygems'
require 'rack'

# The Rack is a modular interface to handle web requests.
# Rack interface abstracts away the handling of HTTP requests and responses 
# into a single, simple call method (invoked by an HTTP request) that passes 
# in a hash of environment variables and return an array that contains:
# - The HTTP response code
# - environment hash, which in most cases the hash of headers of http response
# - The response body, which must respond to each
# 
# Classes that satisfy Rack’s call interface can be chained together as filters. 
# Rack itself includes a number of useful filter classes that do things such as 
# logging and exception handling.
# 

app = Proc.new do |env|
	[
		200,
		{'Content-Type' => 'text/html'},
		['A barebones rack app.', '<h1>Happy coding Rack apps!</h1>']
	]
end

# access http://localhost:12000
Rack::Handler::WEBrick.run(app, :Port => 12000) # binding to port 12000 

