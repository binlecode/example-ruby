require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response.content_type = 'text/plain'
    response.body = "Hello, your query is: #{request.query}"
  end
end

class MyHtmlServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response.content_type = 'text/html'
    response.body = %{
      <html><body>
        <p>Hello. You're calling from a #{request['User-Agent']}</p>
        <p>I see parameters: #{request.query.keys.join(', ')}</p>
      </body></html>
    }
  end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
# http://localhost:<port>/?query=hello
server.mount '/', MyServlet
# http://localhost:1234/html?foo=a&bar=b
server.mount '/html', MyHtmlServlet
trap("INT") { server.shutdown }
server.start

