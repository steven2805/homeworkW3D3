require('pg')
require_relative('sql_runner')


class Album 

  attr_accessor :title, :genre, :artist_id

  def initialize (options)
    @title = options["title"]
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  # def save()
  #   db = PG.connect({
  #     dbname: 'music_db',
  #     host: 'localhost'})
  #   sql = "
  #   INSERT INTO albums (
  #   title,
  #   genre,
  #   artist_id
  #   ) VALUES(
  #   '#{@title}',
  #   '#{@genre}',
  #   #{@artist_id}
  #   ) RETURNING id "

  #   result = db.exec(sql)
  #   db.close()
  #   @id = result[0]['id'].to_i
  # end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}','#{genre}','#{@artist_id}') 
    RETURNING *"
    @id = SqlRunner.run(sql) [0]['id'].to_i
  end 



  def self.all()
    db = PG.connect({
      dbname: 'music_db',
      host: 'localhost'})

    sql = " SELECT * FROM albums;"
    x = db.exec(sql)
    db.close()
    return x.map {|x| Album.new(x)}
  end

  def self.find(id)
    db = PG.connect({ dbname: 'music_db', host: 'localhost' })
    sql = "SELECT * FROM albums WHERE id = #{id}"
    results = db.exec(sql)
    db.close()
    order_hash = results.first
    order = Album.new(order_hash)
    return order

  end 


  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end


















end