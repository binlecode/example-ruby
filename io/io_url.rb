
require 'open-uri'
require 'pp'

ou = open("http://www.google.com") do |f|
  pp f.meta
  pp f.readlines
end

