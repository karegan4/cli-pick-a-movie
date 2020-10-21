
class CLI
    #Make instance of application here

    def run
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
        puts "Done!"
        Scraper.new.first_scrape
        puts "Which genre of movie would you like to watch?"
       input = gets.strip
        if input == "1"
            puts "Great! So you'd like to watch an Action movie. Which Action movie would you like more information about?"
            Scraper.new.second_scrape
            input = gets.strip
            if input == "1"
                Scraper.new.dark_knight_info
            elsif input == "5"
                Scraper.new.lord_of_rings
                puts "Press 1 to see more action movies or 2 to return to the main menu."
                input = gets.strip
                if input == "1"
                    Scraper.new.second_scrape
                elsif input == "2"
                    run
                end
            end
        elsif input == "2"
            puts "Great! Adventure movies are awesome! Which would you like to know more about?" 
        else
            puts "Please hold."
        end

    end

end