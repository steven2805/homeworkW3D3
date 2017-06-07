require('pg')


class Album 

  attr_accessor :title, :genre, :artist_id

  def initialize (options)
    @title = options["title"]
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def save()
    db = PG.connect({
      dbname: 'music_db',
      host: 'localhost'})
    sql = "
    INSERT INTO albumns (
    title,
    genre,
    artist_id
    ) VALUES(
    '#{@title}',
    '#{@genre}',
    #{@artist_id}
    ) RETURNING id "

    result = db.exec(sql)
    db.close()
    @id = result[0]['id'].to_i
  end

  def self.all()
    db = PG.connect({
      dbname: 'music_db',
      host: 'localhost'})

    sql = " SELECT * FROM albumns;"
    x = db.exec(sql)
    db.close()
    return x.map {|x| Album.new(x)}
    end

    def self.find(id)
      db = PG.connect({ dbname: 'music_db', host: 'localhost' })
      sql = "SELECT * FROM albumns WHERE id = #{'artist_id'}"
      results = db.exec(sql)
      db.close()
      order_hash = results.first
      order = Album.new(order_hash)
      return order

    end 

















  end