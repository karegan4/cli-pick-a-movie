class Genre
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def movies
        Movie.all.select{|movie| movie.genre == self}
    end
    
    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        if found_genre
            return found_genre
        else
            return self.new(name)
        end
    end
end