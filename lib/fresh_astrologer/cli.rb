class FreshAstrologer::CLI

  def call
    puts "Welcome to Fresh Astrologer!"
    puts "These are the freshest movies in theaters:"
    get_movie_titles
    list_titles
    get_user_movie

  end

  def get_movie_titles
    # @movies = use Scraper.scrape_fresh_in_theaters in a Movies class to get titles array
  end

  def list_titles
    # @movies.each_with_index(1) {|movie, index| puts "#{index}. #{movie}"}
  end

  def get_user_movie
    puts "Which movie interests you?"
    # chosen_movie = gets.strip
    # if @movies.include? {chosen_movie}
    #   return chosen_movie
    # else
    #   puts "invalid entry"
    #   gets_user_movie method restarts
    # end
  end

  def get_director_info
    # use scrape_wiki to get director name and birthday, then hardcode star sign
    # do all of this in a Director class, then pipe into this method
  end

end
