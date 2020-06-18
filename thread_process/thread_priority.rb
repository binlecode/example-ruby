

require 'thread'

thr = Thread.new do |t|
	20.times do |idx| 
		sleep 1
		puts "thread A round #{idx}"

	end
end
thr.priority = -1


thr2 = Thread.new do |t|
	20.times do |idx| 
		sleep 1
		puts "thread B round #{idx}"

	end
end
thr2.priority = -2


thr.join
thr2.join

