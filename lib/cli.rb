
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
            #binding.pry

            if int.between?(1, Movie.all.length)
                Scraper.third_scrape(genre)
                descr = Description.all[int-1]
                #binding.pry
                puts "#{descr.description}"

                main_menu
                
                #binding.pry
            elsif !int.between?(1, Movie.all.length)
                main_menu
            end


        elsif !int.between?(1, 21)
            main_menu
        end
        #binding.pry
        
    end
end
        
    #    
        # if input == "1"

        #     def action_menu
        #         puts ""
        #         puts "Press 1 to see more action movies or 2 to return to the main menu."
        #         input = gets.strip
        #         if input == "1"
        #             action
        #         elsif input == "2"
        #             run
        #         else
        #             puts "Please type a valid number (1-2)"
        #             sleep (2)
        #             action_menu
        #         end
        #     end

    #         def action
    #             puts "Great! So you'd like to watch an Action movie. Which Action movie would you like more information about?"
    #             Scraper.new.second_scrape
    #             input = gets.strip
    #             if input == "1"
    #                 Scraper.new.dark_knight_info
    #                 action_menu
    #             elsif input == "2"
    #                 Scraper.new.lotrrk_info
    #                 action_menu
    #             elsif input == "3"
    #                 Scraper.new.themtn_info
    #                 action_menu
    #             elsif input == "4"
    #                 Scraper.new.inception_info
    #                 action_menu
    #             elsif input == "5"
    #                 Scraper.new.lotrfr_info
    #                 action_menu
    #             elsif input == "6"
    #                 run
    #             else
    #                 puts "Please type a valid number (1-6)"
    #                 sleep (2)
    #                 action
    #             end
    #         end
    #         action
    #     elsif input == "2"
    #         def comedy
    #             def comedy_menu
    #                 puts ""
    #                 puts "Press 1 to see more comedy movies or 2 to return to the main menu."
    #                 input = gets.strip
    #                 if input == "1"
    #                     comedy
    #                 elsif input == "2"
    #                     run
    #                 else
    #                     puts "Please type a valid number (1-2)"
    #                     sleep (2)
    #                     comedy_menu
    #                 end
    #             end
    #             puts "Great! Comedy! Which would you like to know more about?" 
    #             Scraper.new.third_scrape
    #             input = gets.strip
    #             if input == "1"
    #                 Scraper.new.hs_info
    #                 comedy_menu
    #             elsif input == "2"
    #                 Scraper.new.parasite_info
    #                 comedy_menu

    #             elsif input == "3"
    #                 Scraper.new.life_info
    #                 comedy_menu
    #             elsif input == "4"
    #                 Scraper.new.intouchables_info
    #                 comedy_menu

    #             elsif input == "5"
    #                 Scraper.new.back_to_future_info
    #                 comedy_menu
    #             elsif input == "6"
    #                 run
    #             else
    #                 puts "Please type a valid number (1-6)"
    #                 sleep (2)
    #                 comedy
    #             end
    #         end
    #         comedy
            
            
    #     elsif input == "3"
    #         def horror
    #             def horror_menu
    #                 puts ""
    #                 puts "Press 1 to see more horror movies or 2 to return to the main menu."
    #                 input = gets.strip
    #                 if input == "1"
    #                     horror
    #                 elsif input == "2"
    #                     run
    #                 else
    #                     puts "Please type a valid number (1-2)"
    #                     sleep (2)
    #                     horror_menu
    #                 end
    #             end
    #             puts "Ooo a horror movie. Scary! Which movie would you like to know more about?"
    #             Scraper.new.fourth_scrape
    #             input = gets.strip
    #             if input == "1"
    #                 Scraper.new.psycho_info
    #                 horror_menu
    #             elsif input == "2"
    #                 Scraper.new.shining_info
    #                 horror_menu
    #             elsif input == "3"
    #                 Scraper.new.alien_info
    #                 horror_menu
    #             elsif input == "4"
    #                 Scraper.new.tumbbad_info
    #                 horror_menu
    #             elsif input == "5"
    #                 Scraper.new.thing_info
    #                 horror_menu
    #             elsif input == "6"
    #                 run
    #             else
    #                 puts "Please type a valid number (1-6)"
    #                 sleep (2)
    #                 horror
    #             end
                
    #         end
    #         horror
    #     elsif input == "Q"
    #         puts "Thank you for using Pick-a-Movie!"
    #     else
    #         sleep (2)
    #         run
    #     end

    # end
