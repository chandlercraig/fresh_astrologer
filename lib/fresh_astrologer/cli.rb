class CLI

  def call
    puts "Welcome to Fresh Astrologer, a Rotten Tomatoes™ trivia game for the new-age film buff!"
    puts "----------"
    puts "These are the freshest movies in theaters:" 
    list_movie_titles
    puts "----------"
    get_user_movie
    #get_actor_info
  end

  def list_movie_titles
    scrape_fresh_in_theaters
    Movie.titles_arr
    Movie.titles_arr.each_with_index {|movie, index| puts "#{index+1}. #{movie}"}
  end

  def get_user_movie
    puts "Which movie interests you?"
    @@chosen_movie = gets.strip
    @@chosen_movie
    # add functionality for entering index number as movie selection?
    if Movie.titles_arr.include? (@@chosen_movie)
      get_actor_info
    else
      puts "invalid entry"
      get_user_movie
    end
  end

  def get_actor_info
    puts "----------"
    puts "You've chosen #{@@chosen_movie}. Great choice!"
    puts "Would you like to guess who the lead actor is? (enter y or n)"
    @actor_guess = gets.strip
    @actor_guess
    if @actor_guess == "y"
      puts "Enter actor's name below"
      # gets_actor_name
    elsif @actor_guess == "n"
      puts "No shame in that game! The lead actor in #{@@chosen_movie} is..."
    else
      puts "invalid entry"
      get_actor_info
    end
    # use scrape_wiki to get actor name and birthday, then hardcode star sign
    # do all of this in an Actor class, then pipe into this method
  end

end
