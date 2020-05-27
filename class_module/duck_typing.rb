

class Duck
	def quack
		puts "quack, i am #{self.class}"
	end
end

Duck.new.quack

# class openness
class Duck
	attr_accessor :color
end

duck = Duck.new
duck.color = 'RED'
duck.quack

# frog can be a quacker if it quacks

class Frog
	def quack
		puts "croak, i am #{self.class}"
	end
end

quackers = [Duck.new, Frog.new]
quackers.each do |q|
	q.quack
end





