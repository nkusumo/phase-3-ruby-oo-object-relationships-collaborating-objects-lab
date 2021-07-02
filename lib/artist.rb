class Artist
    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist_exists = @@all.find {|artist| artist.name == name}
        if artist_exists
            artist = @@all.find {|artist| artist.name == name}
        else
            artist = Artist.new(name)
        end
        artist
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
    
end