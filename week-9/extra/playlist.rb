# Create a Playlist from Driver Code

# I worked on this challenge by myself.
# I spent 0.75 hours on this challenge.


# Pseudocode



# Initial Solution
class Song
  def initialize(title, artist)
    @title, @artist = title, artist
  end

  def play
    puts "Playing #{@title}..."
  end
end

class Playlist
  def initialize(*songs)
    @songs = songs
  end

  def add(*added_songs)
    added_songs.each {|song| @songs << song}
  end

  def remove(title)
    @songs.delete(title)
  end

  def num_of_tracks
    @songs.length
  end

  def includes?(title)
    @songs.include? title
  end

  def play_all
    @songs.each {|song| song.play}
  end
end

# Refactored Solution


# DRIVER CODE AND TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace")
going_under = Song.new("Going Under", "Evanescence")

my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)

lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")

my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play #How would you model a song getting "played" in Ruby? I used `puts` and `sleep`. You can model this however you want.
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display




# Reflection