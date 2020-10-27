
class CLI
    #Make instance of application here

    def run

        def main_menu
            puts "Type 'Q' to quit."
            input = gets.strip
            if input == "Q"
                puts "Thank you for using Pick-a-Movie!"
            end
        end




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
        Scraper.first_scrape
        puts "Done!"
        Genre.print_all_genres
        puts "Which genre of movie would you like to watch?"
        puts "Please type a number (1-21)."
        input = gets.strip

        int = input.to_i

        if int.between?(1, 21)
            genre = Genre.all[int-1]
            Scraper.second_scrape(genre)
            movie = Movie.all[int-1]
            Movie.print_all_titles
            puts ""
            puts "Which movie would you like to know more about?"
            input = gets.strip
            int = input.to_i

            if int.between?(1, Movie.all.length)
                Scraper.second_scrape(genre)
                desc = Description.all[int-1]
                puts "#{desc.description}"

                main_menu
                
            elsif !int.between?(1, Movie.all.length)
                main_menu
            end


        elsif !int.between?(1, 21)
            main_menu
        end
        
    end
end
        