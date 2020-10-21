class Movie

    @@all = []

    attr_accessor :genre
def initialize(genre)
    @genre = genre
    @@all << self
end

def self.all
    @@all
end

#def print_movie
#    puts "-------"
#    puts "Genre: #{genre}"
#end
end