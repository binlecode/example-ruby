
require 'pg'

puts 'Version of libpg: ' + PG.library_version.to_s


begin
#   con = PG.connect :dbname => 'testdb', :user => 'postgres'
  con = PG.connect :host => '127.0.0.1', 
                   :dbname => 'rubydb', 
                   :user => 'rubyapp',
                   :password => 'ruby123'

  puts con.server_version
  rs = con.exec 'SELECT VERSION()'
  puts rs.getvalue 0, 0

  # do some DDL and DML
  con.exec "DROP TABLE IF EXISTS Cars"
  con.exec "CREATE TABLE Cars(Id INTEGER PRIMARY KEY, 
      Name VARCHAR(20), Price INT)"
  con.exec "INSERT INTO Cars VALUES(1,'Audi',52642)"
  con.exec "INSERT INTO Cars VALUES(2,'Mercedes',57127)"
  con.exec "INSERT INTO Cars VALUES(3,'Skoda',9000)"
  con.exec "INSERT INTO Cars VALUES(4,'Volvo',29000)"
  con.exec "INSERT INTO Cars VALUES(5,'Bentley',350000)"
  con.exec "INSERT INTO Cars VALUES(6,'Citroen',21000)"
  con.exec "INSERT INTO Cars VALUES(7,'Hummer',41400)"
  con.exec "INSERT INTO Cars VALUES(8,'Volkswagen',21600)"

  # do some query with prepared statement
  con.prepare 'stm1', "SELECT * FROM Cars WHERE Id=$1"
  rs = con.exec_prepared 'stm1', [3]
  # obtain result set metadata
  puts 'There are %d columns ' % rs.nfields
  puts 'The column names are:'
  puts rs.fields
  # print result set, a single row in this case
  puts rs.values

  # multi row result set
  con.prepare 'stm2', "SELECT * FROM Cars WHERE price < $1 ORDER BY price LIMIT $2"
  rs = con.exec_prepared 'stm2', [300000, 3]
  rs.each do |r|
    puts r['id'] + ' => ' + r['name'] + ': $' + r['price'] 
  end


  # get some database metadata
#   rs = con.exec "SELECT table_name FROM information_schema.tables 
  rs = con.exec "SELECT table_schema, table_name FROM information_schema.tables 
    WHERE table_schema = 'public'"
  rs.each do |row|
    puts row
  end

  # transaction control
  begin
    con.transaction do |con|
      con.exec "UPDATE Cars SET Price=23700 WHERE Name='Volkswagen'"
      # will triger tx rollback due to table name error
      con.exec "INSERT INTO Car VALUES(9,'Mazda',27770)" 
    end
  rescue Exception => ex
    puts "transaction error: #{ex.message}"
  end

  # this shows Volkswagen price is still 21600, not changed by the tx error above
  puts (con.exec "select price from cars where Name='Volkswagen'").getvalue 0, 0

rescue PG::Error => e
  puts e.message 
ensure
  rs.clear if rs # release cache memory
  con.close if con # release connection resource
end

