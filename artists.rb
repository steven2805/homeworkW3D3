require('pg')
#require relative sql runner

class Artist
  attr_accessor :id , :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    db = PG.connect({
      dbname: 'music_db',
      host: 'localhost' })
    sql = "
    INSERT INTO artists(
    name
    ) VALUES(
    '#{@name}'
    ) RETURNING id"

    result = db.exec(sql)
    db.close()
    @id = result[0]['id'].to_i
  end 

  def self.all()
    db = PG.connect({
      dbname: 'music_db',
      host: 'localhost'})

    sql = " SELECT * FROM artists;"
    x = db.exec(sql)
    db.close()
    return x.map {|x| Artist.new(x)}
    end

end