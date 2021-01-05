require 'watir'
require 'nokogiri'

class Scraper
  
  def scrape_fresh_in_theaters
    fresh_titles = []
    browser = Watir::Browser.new
    browser.goto("https://www.rottentomatoes.com/browse/cf-in-theaters")
    js_doc = browser.element(css: ".mb-movies").wait_until(&:present?)
    news = Nokogiri::HTML(js_doc.inner_html)
    news.css(".mb-movie .movieTitle").each do |movie|   
    fresh_titles << movie.text
    end
    fresh_titles.each_with_index {|movi, index| puts "#{index+1}. #{movi}"}
  end

  def scrape_wiki
    # scrape for director name and birthday

  end
end
