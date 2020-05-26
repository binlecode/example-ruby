# the object is called 'subject' when is Observable
# the object is called 'observer' when it gets notification


module Subject
  def initialize
    @observers ||= []
  end

  def add_observer(obsvr)
    @observers << obsvr
  end

  def remove_observer(obsvr)
    @observers.delete obsvr
  end

  def notify_observers
    @observers.each do |obsvr|
      puts "notifying #{obsvr.inspect}"
      obsvr.update(self) # put object itself as argument
    end
  end
end


class Employee
  include Subject

  attr_reader :name, :address, :salary

  def initialize(name, title, salary)
    super() # calls the module's initializer with explicitly zero number of arguments
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(salary)
    @salary = salary
    notify_observers
  end

end

class EmailAgent
  def update(ctx)
    puts "sending email to #{ctx}, new salary is #{ctx.salary}"
  end
end

class Manager
  def update(ctx)
    puts "your report #{ctx} new salary is #{ctx.salary}"
  end
end


emp = Employee.new('Fred', 'Engineer', 60000)
emp.add_observer EmailAgent.new
emp.add_observer Manager.new
puts emp.salary
emp.salary = 65000


# ruby makes observer pattern even easier by using Proc objects as observers

module Subject
  def add_observer_proc(&block)
    def block.update(ctx) # defining a singleton method to accept 'update' call and delegate to 'call' method
      self.call ctx # here 'self' refers to the proc object
    end

    @observers << block
  end

  def clear_observers
    @observers.clear
  end
end


emp.add_observer_proc do |ctx|
  puts "a proc angent sending email to #{ctx} new salary #{ctx.salary}"
end

emp.salary = 70000








