class CLI
    #Make instance of application here
    def welcome_message
        puts "Welcome to the"
        puts "
        +-+-+-+-+-+-+-+-+-+-+-+-+
        |P|i|c|k|-|a|-|M|o|v|i|e|
        ++-+-+-++-+-+-+-+-+-+-+-+
         |A|p|p|                 
         +-+-+-+                 
       "
       sleep (1)
       puts "Loading..."
    end

    def main_menu
        puts "Type 1 to return to the main menu."
        puts "Type 'Q' to quit."
        menu_input = gets.strip
        if menu_input == "Q"
            puts "Thank you for using Pick-a-Movie!"
        elsif menu_input == "1"
            self.run
        else
            "Please type 'Q' to quit, or '1' to return to the main menu."
            main_menu
        end
    end

    def load_genres
        Genre.all.each_with_index do |genre, index|
            puts "#{index + 1}. - #{genre.name}"
        end
        
    end

    def load_titles
        puts "Which genre of movie would you like to watch?"
        puts "Please type a number (1-21)"
        genre_input = gets.strip.to_i
        if genre_input > 0 && genre_input <= Genre.all.length
            genre = Genre.all[genre_input-1]
            Scraper.second_scrape(genre)
            movie = Title.all[genre_input-1]
            Title.all.each_with_index do |movie_title, index|
                puts "#{index + 1} - #{movie_title.title}"
            end

            puts ""
            puts "You've chosen the movie genre: #{genre.name}."
            puts ""
            puts "Which movie would you like to know more about?"
            Scraper.second_scrape(genre)
        else
            load_titles
        end
    end

    def load_descriptions
        title_input = gets.strip.to_i
        if title_input > 0 && title_input <= Title.all.length
            desc = Description.all[title_input-1]
            puts "#{desc.description}"
        else
            puts "Please select a number between 1 and #{Title.all.length}"
            load_descriptions
        end
    end

    def run
        
        self.welcome_message
        Title.clear
        Scraper.first_scrape
        puts "Done!"
        self.load_genres

        self.load_titles

        self.load_descriptions
        self.main_menu
    end
        
end
        