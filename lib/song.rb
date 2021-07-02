class Song
    @@all = []
    def self.all
        @@all
    end
    
    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(filename)
        file_title = filename.split(" - ")[1]
        file_artist = filename.split(" - ")[0]
        new_song = self.new(file_title)
        new_song.artist_name = file_artist
        new_song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end