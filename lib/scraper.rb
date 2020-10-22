require 'nokogiri'
require 'pry'

#1. Make a Genre class and make the three instances of the Genres that you want in the first scrape. DON'T FORGET that you also need the URL to go to that Genre's movie page. 
#2. Then write a second scraper method that accepts an argument of a Genre instance, uses the assocaited movie_page_url (or whatvever you end up calling it) to scrape all the movies for that Genre. Grab the title and description and make new movie instances (don't forget to associate those new movie instances with the instance of the Genre that got passed in)
#3. Make what we wrote in the CLI class work 




class Scraper

    def initialize
        @base_url = "https://imdb.com"
    end

    def first_scrape
       html = open(@base_url + "/chart/top/")
        html_parsed_to_elements = Nokogiri::HTML(html)
        genre_elements = html_parsed_to_elements.css('.subnav_item_main')
        genre_elements.each do |movie_genre|

            genre_name = movie_genre.css("a").text.strip
            genre_url = movie_genre.css("a")[0].attr("href")
        
            genre = Genre.find_or_create_by_name(genre_name, genre_url)

           # movie = Movie.new(title)
        end
        #binding.pry
    end
    def second_scrape (genre)
        movie_page_url = open(@base_url + genre.genre_url)
        movie_page_url_parsed_to_elements = Nokogiri::HTML(movie_page_url)
        movie_titles = html_parsed_to_elements.css('.lister')

        movie_titles.each do |movie_title|
            title = movie_title.css("h3 a").text

            movie = Movie.find_or_create_by_name(title, movie_page_url)
        end
        binding.pry
        
    end
end


    # def second_scrape
    #     html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     action_elements = html_parsed_to_elements.css('.lister-list')

    #     action_elements.each do |action_movies|
    #         movie_name = action_movies.css(".lister-item-header a").text
    #         first_movie_name = action_movies.css(".lister-item-header a").first.text
    #         second_movie_name = action_movies.css(".lister-item-header a")[1].text
    #         third_movie_name = action_movies.css(".lister-item-header a")[2].text
    #         fourth_movie_name = action_movies.css(".lister-item-header a")[3].text
    #         fifth_movie_name = action_movies.css(".lister-item-header a")[4].text
    #         puts "Action Movie Titles:"
    #         puts "1. #{first_movie_name}"
    #         puts "2. #{second_movie_name}"
    #         puts "3. #{third_movie_name}"
    #         puts "4. #{fourth_movie_name}"
    #         puts "5. #{fifth_movie_name}"
            
    #     end
    # end

    # def dark_knight_info
    #     html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     dark_desc = html_parsed_to_elements.css('.lister')

    #     dark_desc.each do |describe|
    #         dark_description = describe.css("p")[1].text
    #         puts "Description:"
    #         puts "#{dark_description}"
    #     end
    # end

    # def lotrrk_info
    #     html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     lotr_desc = html_parsed_to_elements.css('.lister')

    #     lotr_desc.each do |describe|
    #         lotr_description = describe.css("p")[5].text
    #         puts "Description:"
    #         puts "#{lotr_description}"
    #     end
    # end

    # def themtn_info
    #     html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     themtn_desc = html_parsed_to_elements.css('.lister')

    #     themtn_desc.each do |describe|
    #         themtn_description = describe.css("p")[9].text
    #         puts "Description:"
    #         puts "#{themtn_description}"
    #     end
    # end

    # def inception_info
    #     html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     inception_desc = html_parsed_to_elements.css('.lister')

    #     inception_desc.each do |describe|
    #         inception_description = describe.css("p")[13].text
    #         puts "Description:"
    #         puts "#{inception_description}"
    #     end
    # end

    # def lotrfr_info
    #     html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     lotrfr_desc = html_parsed_to_elements.css('.lister')

    #     lotrfr_desc.each do |describe|
    #         lotrfr_description = describe.css("p")[17].text
    #         puts "Description:"
    #         puts "#{lotrfr_description}"
    #     end
    # end

    # def third_scrape
    #     html = open(@base_url + "/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     comedy_elements = html_parsed_to_elements.css('.lister-list')

    #     comedy_elements.each do |comedy_movies|
    #         comedy_movie_name = comedy_movies.css(".lister-item-header a").text
    #         first_movie_name = comedy_movies.css(".lister-item-header a").first.text
    #         second_movie_name = comedy_movies.css(".lister-item-header a")[1].text
    #         third_movie_name = comedy_movies.css(".lister-item-header a")[2].text
    #         fourth_movie_name = comedy_movies.css(".lister-item-header a")[3].text
    #         fifth_movie_name = comedy_movies.css(".lister-item-header a")[4].text
    #         puts "Comedy Movie Titles:"
    #         puts "1. #{first_movie_name}"
    #         puts "2. #{second_movie_name}"
    #         puts "3. #{third_movie_name}"
    #         puts "4. #{fourth_movie_name}"
    #         puts "5. #{fifth_movie_name}"
    #     end
    # end

    # def hs_info
    #     html = open(@base_url + "/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     hs_desc = html_parsed_to_elements.css('.lister')

    #     hs_desc.each do |describe|
    #         hs_description = describe.css("p")[1].text
    #         puts "Description:"
    #         puts "#{hs_description}"
    #     end
    # end

    # def parasite_info
    #     html = open(@base_url + "/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     para_desc = html_parsed_to_elements.css('.lister')

    #     para_desc.each do |describe|
    #         para_description = describe.css("p")[5].text
    #         puts "Description:"
    #         puts "#{para_description}"
    #     end
    # end

    # def life_info
    #     html = open(@base_url + "/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     life_desc = html_parsed_to_elements.css('.lister')

    #     life_desc.each do |describe|
    #         life_description = describe.css("p")[9].text
    #         puts "Description:"
    #         puts "#{life_description}"
    #     end
    # end

    # def intouchables_info
    #     html = open(@base_url + "/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     intouchables_desc = html_parsed_to_elements.css('.lister')

    #     intouchables_desc.each do |describe|
    #         intouchables_description = describe.css("p")[13].text
    #         puts "Description:"
    #         puts "#{intouchables_description}"
    #     end
    # end

    # def back_to_future_info
    #     html = open(@base_url + "/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     future_desc = html_parsed_to_elements.css('.lister')

    #     future_desc.each do |describe|
    #         future_description = describe.css("p")[17].text
    #         puts "Description:"
    #         puts "#{future_description}"
    #     end
    # end

    # def fourth_scrape
    #     html = open(@base_url + "/search/title/?genres=horror&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_12")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     horror_elements = html_parsed_to_elements.css('.lister-list')

    #     horror_elements.each do |horror_movies|
    #         horror_movie_name = horror_movies.css(".lister-item-header a").text
    #         first_movie_name = horror_movies.css(".lister-item-header a").first.text
    #         second_movie_name = horror_movies.css(".lister-item-header a")[1].text
    #         third_movie_name = horror_movies.css(".lister-item-header a")[2].text
    #         fourth_movie_name = horror_movies.css(".lister-item-header a")[3].text
    #         fifth_movie_name = horror_movies.css(".lister-item-header a")[4].text
    #         puts "Horror Movie Titles:"
    #         puts "1. #{first_movie_name}"
    #         puts "2. #{second_movie_name}"
    #         puts "3. #{third_movie_name}"
    #         puts "4. #{fourth_movie_name}"
    #         puts "5. #{fifth_movie_name}"
    #         puts "6. Return to main menu"
    #     end
    # end

    # def psycho_info
    #     html = open(@base_url + "/search/title/?genres=horror&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_12")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     psycho_desc = html_parsed_to_elements.css('.lister')

    #     psycho_desc.each do |describe|
    #         psycho_description = describe.css("p")[1].text
    #         puts "Description:"
    #         puts "#{psycho_description}"
    #     end
    # end

    # def shining_info
    #     html = open(@base_url + "/search/title/?genres=horror&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_12")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     shining_desc = html_parsed_to_elements.css('.lister')

    #     shining_desc.each do |describe|
    #         shining_description = describe.css("p")[5].text
    #         puts "Description:"
    #         puts "#{shining_description}"
    #     end
    # end

    # def alien_info
    #     html = open(@base_url + "/search/title/?genres=horror&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_12")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     alien_desc = html_parsed_to_elements.css('.lister')

    #     alien_desc.each do |describe|
    #         alien_description = describe.css("p")[9].text
    #         puts "Description:"
    #         puts "#{alien_description}"
    #     end
    # end

    # def tumbbad_info
    #     html = open(@base_url + "/search/title/?genres=horror&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_12")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     tumbbad_desc = html_parsed_to_elements.css('.lister')

    #     tumbbad_desc.each do |describe|
    #         tumbbad_description = describe.css("p")[13].text
    #         puts "Description:"
    #         puts "#{tumbbad_description}"
    #     end
    # end

    # def thing_info
    #     html = open(@base_url + "/search/title/?genres=horror&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_12")
    #     html_parsed_to_elements = Nokogiri::HTML(html)
    #     thing_desc = html_parsed_to_elements.css('.lister')

    #     thing_desc.each do |describe|
    #         thing_description = describe.css("p")[17].text
    #         puts "Description:"
    #         puts "#{thing_description}"
    #     end
    # end


        
 #   binding.pry