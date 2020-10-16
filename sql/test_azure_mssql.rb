
require 'tiny_tds'
require 'yaml'

# looking for a `db_conn.yml` configuration file
# assume yaml file has following keys
# mssql:
#     server:
#     database:
#     username:
#     password:
#

conn = YAML.load_file('db_conn.yml')
db_conn = conn['mssql']
puts db_conn.inspect

# note the azure: true option in client setup
client = TinyTds::Client.new username: db_conn['username'],
    password: db_conn['password'],
    host: db_conn['server'],
    database: db_conn['database'],
    port: 1433,
    azure: true

puts "Connecting to Azure sql server database"

if client.active? == true 
    puts "Connected, client charset: #{client.charset}"
else
    puts 'Connection failed'
    exit 1
end

# do some tsql

result = client.execute('select 1 as [one]')
puts result.respond_to? :each   # result is enumerable
data = result.each   # call each without block => get a cursor
puts data.first.class == Hash
puts data.first['one']   # => 1

# a query getting all table and columns
# tsql = """
# select * from (
#     select schema_name(tab.schema_id) as schema_name,
#         tab.name as table_name, 
#         col.column_id,
#         col.name as column_name, 
#         t.name as data_type,    
#         col.max_length,
#         col.precision
#     from sys.tables as tab
#         inner join sys.columns as col
#             on tab.object_id = col.object_id
#         left join sys.types as t
#         on col.user_type_id = t.user_type_id
# ) t
# order by t.schema_name,
#     t.table_name,
#     t.column_id
# """

# result = client.execute(tsql)
# result.each do |row|
#     puts row
# end

client.close

# for more query use cases, see:
# https://github.com/rails-sqlserver/tiny_tds/blob/master/test/result_test.rb


# this is a simple localhost sql connection example

# puts 'Connecting to SQL Server'

# @client = TinyTds::Client.new username: user, 
#     password: pswd,
#     host: host, 
#     port: port

