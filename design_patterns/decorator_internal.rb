# ruby open class nature supports adding decoration to the same class or object at runtime


class Car
  def run
    puts 'the car starts running'
  end
end

# at runtime we can 'open' the class
if true
  class Car
    def start_and_run
      start_engine
      run
    end

    def start_engine
      puts 'the car starts the engine'
    end
  end

  c = Car.new
  c.start_and_run
end


# if the change is only for one instance object, we can do as singleton methods
c.instance_eval do |obj|
  def fuel_tank
    puts 'the car starts to fill the gas'
  end

  def drive
    fuel_tank
    start_and_run
  end
end

c.drive # this method is only available to instance object c
# if try this method on another instance, we will get NoMethod exception
begin
  Car.new.drive
rescue Exception => exp
  puts exp.class
  puts exp.message
  puts exp.backtrace.inspect
end







