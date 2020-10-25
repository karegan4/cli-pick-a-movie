require 'nokogiri'
require 'pry'

#1. Make a Genre class and make the three instances of the Genres that you want in the first scrape. DON'T FORGET that you also need the URL to go to that Genre's movie page. 
#2. Then write a second scraper method that accepts an argument of a Genre instance, uses the assocaited movie_page_url (or whatvever you end up calling it) to scrape all the movies for that Genre. Grab the title and description and make new movie instances (don't forget to associate those new movie instances with the instance of the Genre that got passed in)
#3. Make what we wrote in the CLI class work 

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
        #binding.pry
    end

    def self.second_scrape (genre)
        movie_page_url = open(@@base_url + "#{genre.url}")
        movie_page_url_parsed_to_elements = Nokogiri::HTML(movie_page_url)
        movie_titles = movie_page_url_parsed_to_elements.css('.lister-item')

        movie_titles.each do |movie_title|
            title = movie_title.css("h3 a").text

            movie = Movie.find_or_create_by_name(title, movie_page_url)
        end
        #binding.pry
        
    end

    def self.third_scrape(genre)
        desc_page_url = open(@@base_url + "#{genre.url}")
        #binding.pry
        desc_page_url_parsed = Nokogiri::HTML(desc_page_url)
        descrips = desc_page_url_parsed.css('.lister-item')

        descrips.each do |describe|
            description = describe.css("p.text-muted[4]").text.strip
            #binding.pry
            list = Description.find_or_create_by_name(description)
        end
        #binding.pry
    end
end