require 'watir'
require 'nokogiri'

class Scraper
  def scrape_fresh_in_theaters
    browser = Watir::Browser.new
    browser.goto("https://www.rottentomatoes.com/browse/cf-in-theaters")
    js_doc = browser.element(css: ".mb-movie").wait_until(&:present?)
    news = Nokogiri::HTML(js_doc.inner_html)
    desired_result = news('.mb-movie')
    # returns array of movies
    binding.pry
  end

  def scrape_wiki
    # scrape for director name and birthday

  end
end
