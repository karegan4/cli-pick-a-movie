
class CLI
    #Make instance of application here

    def run
        puts "Welcome to the CLI Pick a Movie app!"
        sleep (1)
        puts "Loading..."
        puts "Done!"
        Scraper.new.first_scrape
        puts "Which genre of movie would you like to watch?"
       input = gets.strip
        if input == "Action"
            puts "Great! So you'd like to watch an Action movie. Which Action movie would you like more information about?"
            Scraper.new.second_scrape
        else
            puts "Please hold."
        end
=begin            puts "Here are your choices for action movies:"
        elsif input == "2"
            puts "Here are your choices for Comedy movies:"
        elsif input == "3"
            puts "Here are your choices for Family movies:"
        elsif input == "4"
            puts "Here are your choices for Horror movies:"
        elsif input == "5"
            puts "Here are your choices for Thriller movies:"
        else
            puts "That is not an option. Please try again."
        end
=end
    end

end