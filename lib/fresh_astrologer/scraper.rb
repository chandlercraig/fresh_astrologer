class FreshAstrologer::Scraper

  def scrape_fresh_in_theaters
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto("https://www.rottentomatoes.com/browse/cf-in-theaters")
    js_doc = browser.element(css: ".mb-movies").wait_until(&:present?)
    html_mov = Nokogiri::HTML(js_doc.inner_html)
    html_mov.css(".mb-movie .movieTitle").each {|mov| Movie.titles_arr << mov.text}
  end

  def scrape_movie
    scrape_fresh_in_theaters
    Movie.titles_arr.each do |title|
      url_mov_title = title.downcase.gsub(/[^\w\s]/, '').gsub!(" ","_")
      url = Curl.get("https://www.rottentomatoes.com/m/" + "#{url_mov_title}")
      html = Nokogiri::HTML(url.body_str)
      actor = html.css("meta[name=description]").to_s.match(/(?<=\()[^\)]+/).to_a[0]
      Movie.new(title, actor)
    end
  end

  def scrape_wiki_for_birthday
    scrape_movie
    Movie.all.each do |movie|
      actor = movie.lead_actor
      movie_title = movie.title
      if actor != nil
        url_lead_actor = actor.gsub(" ","_")
        url = Curl.get("https://en.wikipedia.org/wiki/" + "#{url_lead_actor}")
        html = Nokogiri::HTML(url.body_str)
        bday = html.css(".bday").inner_html
        Actor.new(actor, bday, movie_title)
      end 
    end 
  end

  
end
