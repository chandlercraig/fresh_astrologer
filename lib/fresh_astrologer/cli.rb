class FreshAstrologer::CLI

  def call
    puts "Welcome to Fresh Astrologer!"
    puts "These are the freshest movies in theaters"
    movie_titles
    gets_movie


  end

  def movie_titles
    # use Scraper.scrape_fresh_in_theaters to get titles
    # list titles
  end

  def gets_movie
    puts "Which movie interests you?"
    # gets valid user input
    # if input is invalid puts "invalid entry"
    #   gets_movie method restarts
    # use
  end

  def director_info

  end

end
