

class MyComparable
	include Comparable

	attr_accessor :name

	def initialize(name)
		self.name = name
	end

	def <=>(other) 
		self.name <=> other.name
	end

end


mc1 = MyComparable.new('abc')
mc2 = MyComparable.new('xyz')

p mc1 > mc2
p mc1 == mc2
p mc1 < mc2
