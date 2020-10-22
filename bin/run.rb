require 'pry'
require_relative "../config/environment.rb"

CLI.new.run

#url = "https://www.imdb.com/chart/top/"
#html = open(url)
#hi = Nokogiri::HTML(html)
#binding.pry

#url = "https://www.imdb.com/search/title/?genres=comedy&sort=user_rating,desc&title_type=feature&num_votes=25000,&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=5aab685f-35eb-40f3-95f7-c53f09d542c3&pf_rd_r=9WCAAT5YKX085TKXRD5K&pf_rd_s=right-6&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_gnr_5"
#html = open(url)
#hi = Nokogiri::HTML(html)
#binding.pry

