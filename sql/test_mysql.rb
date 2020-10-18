require 'rubygems'
require 'mysql'

# Optional: use a `db_conn.yml` configuration file
# assume yaml file has following keys
# mysql:
#     host:
#     database:
#     username:
#     password:
#

db = Mysql.connect('localhost', 'root', '', 'test')

rs = db.query('select 1')
puts rs.num_rows

db.close
