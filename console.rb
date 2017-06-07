require ('pry-byebug')
require_relative('artists.rb')
require_relative('albumns.rb')
require_relative('sql_runner')


artist1 = Artist.new({ 'name' => 'Bob Dylan' })
artist2 = Artist.new({ 'name' => 'Micheal Jackson'})
artist3 = Artist.new({ 'name' => 'RadioHead'})
artist4 = Artist.new({ 'name' => 'Foo Fighters'})

artist1.save()
artist2.save()
artist3.save()
artist4.save()

album_1 = Album.new({ 'title'=> 'Blood on the Tracks',
  'genre'=> "Folk",
  'artist_id' => artist1.id
  })
album_1.save()

album_2 = Album.new({ 'title'=> 'Thriller',
  'genre'=> "Wako",
  'artist_id' => artist2.id
  })
album_2.save()

album_3 = Album.new({'title' => 'no surprises',
  'genre' => 'Alternative Rock', 'artist_id' => artist3.id
  })
album_3.save()

album_4 = Album.new({'title' => 'the pretender',
  'genre' => 'Alternative Rock', 'artist_id' => artist4.id
  })
album_4.save()



binding.pry
nil