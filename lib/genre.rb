class Genre
    @@all = []

    attr_accessor :name, :url

    def initialize(name, url)
        @name = name
        @url = url 
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.find_or_create_by_name(name, url)
        found_genre = self.all.find do |genre| 
            genre.name == name
        end
        if found_genre
          return found_genre
        else
          return self.new(name, url)
        end
    end



end
