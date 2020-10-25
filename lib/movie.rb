class Movie

    @@all = []

    attr_accessor :title, :movie_page_url


    def initialize(title, movie_page_url)
        @title = title
        @movie_page_url = movie_page_url
        @@all << self
    end
    
    def self.all
        @@all
    end


    def self.find_or_create_by_name(title, movie_page_url)
        found_title = self.all.find do |title|
            title.title == title
        end
        if found_title
            return found_title
        else
            return self.new(title, movie_page_url)
        end
    end

    def self.print_all_titles
        Movie.all.each_with_index do |title, index|
            puts "#{index + 1}. - #{title.title}"
        end
    end


    
    #binding.pry

end