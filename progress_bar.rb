require_relative './gem_installer'



require 'rubygems'
#require 'progressbar'
gem 'progressbar', '~> 0.1'


bar = ProgressBar.new("Example progress", 50)
total = 0
until total >= 50
  sleep(rand(2)/2.0)
  increment = (rand(6) + 3)
  bar.inc(increment)
  total += increment
end

