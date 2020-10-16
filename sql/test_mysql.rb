
require 'rubygems'
require 'mysql'

db = Mysql.connect('localhost', 'root', '', 'test')

rs = db.query("select 1")
puts rs.num_rows

db.close
