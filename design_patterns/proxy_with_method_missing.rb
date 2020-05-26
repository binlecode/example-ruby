# in ruby, the method call is message sending in nature
# the runtime method_missing event hook makes proxy pattern easy in ruby

class MyClass

  def hello
    puts 'myClass says hello!'
  end

end


class MyClassProxy

  def initialize(myClass)
    @subject = myClass
  end

  # use method_missing event handler to delegate method calls to proxied subject
  def method_missing(method_name, *args)
    # put down additional logic before delegating to subject
    puts "method not found -> delegating method #{method_name} to subject #{@subject}"
    proxy_before_handler

    # method call delegation
    result = @subject.send(method_name, *args)

    # put down additional logic with subject method call return
    puts "the subject method returned: #{result}"
    proxy_after_handler

    result
  end

  # from here we can define before or after handlers (callbacks)

  def proxy_before_handler
    puts 'this is before method call handler'
  end

  def proxy_after_handler
    puts 'this is after method call handler'
  end
end


mcp = MyClassProxy.new(MyClass.new)
# mcp class doesn't have native hello method, thus its method_missing method will be invoked
mcp.hello


# we add a singleton method to the proxy at runtime
def mcp.hello
  puts 'myClassProxy object defined its own hello method'
end

mcp.hello