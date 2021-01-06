require 'watir'
require 'nokogiri'

class Scraper

  def scrape_fresh_in_theaters
    fresh_titles = []
    browser = Watir::Browser.new
    browser.goto("https://www.rottentomatoes.com/browse/cf-in-theaters")
    js_doc = browser.element(css: ".mb-movies").wait_until(&:present?)
    mov_el = Nokogiri::HTML(js_doc.inner_html)
    browser.close
    mov_el.css(".mb-movie .movieTitle").each {|mov| fresh_titles << mov.text}
    fresh_titles
  end

  def scrape_wiki
    search_url = 'https://en.wikipedia.org/w/api.php?action=opensearch&format=json&search='
    mov_4_html = search_url + "Farewell_Amor"

    # scrape for director name and birthday

  end
end
