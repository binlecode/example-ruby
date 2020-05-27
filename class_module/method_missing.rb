#!/usr/bin/env ruby

puts $:


class Box 
	attr_accessor :size, :color

	include Comparable

	def <=>(other)
		self.size <=> other.size
	end



	
	def initialize(size, color)
		@size = size
		@color = color
	end

	def to_s
		"Box instance: " + self.inspect
	end

	def method_missing(method)
		puts "arr, no idea of #{method}"
	end

end

=begin DOCUMENT TAG
Embedded documents can be used to include long blocks 
of documentation within a program, or to embed source 
code of another language (such as HTML or SQL) within 
a Ruby program.

Embedded documents are usually intended to be used by
some kind of postprocessing tool that is run over the 
Ruby source code, and it is typical to follow =begin 
with an identifier that indicates which tool the comment 
is intended for.
=end


class MatchBox < Box
	def initialize(size, color)
		super(size, color)
	end
	
	def to_s
		"MatchBox instance: " + self.inspect
	end
end


mb = MatchBox.new(12, "pink")

mb2 = MatchBox.new(12, "blue")

puts mb < mb2


