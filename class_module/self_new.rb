
class Parent

    # considerred bad: subclasses will get Parent class instance
    def self.get_new_one
        Parent.new    
    end

    # self in this method will be associated to current or subclass
    def self.new_instance
        self.new
    end

end


class Child < Parent
    # methods ...
end



c = Child.get_new_one
puts c.inspect  # getting a person instance

c2 = Child.new_instance
puts c2.inspect # getting a child instance



