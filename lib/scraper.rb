require 'nokogiri'
require 'pry'
class Scraper

    def initialize
        @base_url = "https://imdb.com"
    end

    def first_scrape
       html = open(@base_url + "/chart/top/")
        html_parsed_to_elements = Nokogiri::HTML(html)
        genre_elements = html_parsed_to_elements.css('.quicklinks')
        
        genre_elements.each do |movie_genre|
            first_genre_name = movie_genre.css("a")[0].text
            second_genre_name = movie_genre.css("a")[1].text
            third_genre_name = movie_genre.css("a")[4].text
            #title = movie_genre.css(".titleColumn").text
        
            
            #genre = Genre.find_or_create_by_name(genre_name)

         #   Movie.new(genre_name)

            puts "Genres: "
            puts "1. #{first_genre_name}"
            puts "2. #{second_genre_name}"
            puts "3. #{third_genre_name}"

        end

    end
    def second_scrape
        html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
        html_parsed_to_elements = Nokogiri::HTML(html)
        action_elements = html_parsed_to_elements.css('.lister-list')

        action_elements.each do |action_movies|
            movie_name = action_movies.css(".lister-item-header a").text
            first_movie_name = action_movies.css(".lister-item-header a").first.text
            second_movie_name = action_movies.css(".lister-item-header a")[1].text
            third_movie_name = action_movies.css(".lister-item-header a")[2].text
            fourth_movie_name = action_movies.css(".lister-item-header a")[3].text
            fifth_movie_name = action_movies.css(".lister-item-header a")[4].text
            puts "Action Movie Titles:"
            puts "1. #{first_movie_name}"
            puts "2. #{second_movie_name}"
            puts "3. #{third_movie_name}"
            puts "4. #{fourth_movie_name}"
            puts "5. #{fifth_movie_name}"
            
        end
    end

    def dark_knight_info

    end

    def lord_of_rings
        html = open(@base_url + "/search/title/?genres=action&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_1")
        html_parsed_to_elements = Nokogiri::HTML(html)
        lord_desc = html_parsed_to_elements.css('.lister')

        lord_desc.each do |describe|
            lord_description = describe.css("p")[1].text
            puts "Description:"
            puts "#{lord_description}"
        end
    end
 #   binding.pry
end