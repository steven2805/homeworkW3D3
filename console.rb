require ('pry-byebug')
require_relative('artists.rb')
require_relative('albumns.rb')




artist_1 = Artist.new({ 'name' => 'Bob Dylan' })
artist_2 = Artist.new({ 'name' => 'Micheal Jackson'})

artist_1.save()
artist_2.save()



album_1 = Album.new({ 'title'=> 'Blood on the Tracks',
                        'genre'=> "Folk",
                        'artist_id' => artist_1.id
                        })
album_1.save()

album_2 = Album.new({ 'title'=> 'Thriller',
                        'genre'=> "Wako",
                        'artist_id' => artist_2.id
                        })
album_2.save()


binding.pry
nil