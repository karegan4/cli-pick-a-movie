require 'nokogiri'
require 'pry'

class Scraper

    
    @@base_url = "https://imdb.com"             

    def self.first_scrape
        html = open(@@base_url + "/chart/top/")
        html_parsed_to_elements = Nokogiri::HTML(html)
        genre_elements = html_parsed_to_elements.css('.subnav_item_main')
        genre_elements.each do |movie_genre|           

            genre_name = movie_genre.css("a").text.strip
            genre_url = movie_genre.css("a").attr("href").text
        
            genre = Genre.find_or_create_by_name(genre_name, genre_url)

        end
    end

    def self.second_scrape (genre)
        movie_page_url = open(@@base_url + "#{genre.url}")
        movie_page_url_parsed_to_elements = Nokogiri::HTML(movie_page_url)
        movie_titles = movie_page_url_parsed_to_elements.css('.lister-item')

        movie_titles.each do |movie_title|
            title = movie_title.css("h3 a").text

            movie = Title.find_or_create_by_name(title, movie_page_url)
        end

        movie_titles.each do |describe|
            description = describe.css("p.text-muted[4]").text.strip
            
            desc = Description.find_or_create_by_name(description)
        end
        
    end

   
end