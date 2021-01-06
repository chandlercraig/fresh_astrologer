class CLI

  def call
    puts "Welcome to Fresh Astrologer, a Rotten Tomatoes™ trivia game for the new-age film buff!"
    puts "----------"
    puts "These are the freshest movies in theaters:" 
    list_movie_titles
    puts "----------"
    get_user_movie
    #get_director_info
  end

  def list_movie_titles
    @@movies = Scraper.new.scrape_fresh_in_theaters
    @@movies.each_with_index {|movie, index| puts "#{index+1}. #{movie}"}
  end

  def get_user_movie
    puts "Which movie interests you?"
    @@chosen_movie = gets.strip
    @@chosen_movie
    # add functionality for entering index number as movie selection?
    if @@movies.include? (@@chosen_movie)
      get_director_info
    else
      puts "invalid entry"
      get_user_movie
    end
  end

  def get_director_info
    puts "----------"
    puts "You've chosen #{@@chosen_movie}. Great choice!"
    puts "Would you like to guess the director? (enter y or n)"
    @chosen_dir = gets.strip
    @chosen_dir
    if @chosen_dir == "y"
      puts "Enter directors name below"
    elsif @chosen_dir == "n"
      puts "No shame in that game! The director of #{@@chosen_movie} is..."
    else
      puts "invalid entry"
      get_director_info
    end
    # use scrape_wiki to get director name and birthday, then hardcode star sign
    # do all of this in a Director class, then pipe into this method
  end

end
