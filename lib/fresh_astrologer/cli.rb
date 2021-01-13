class CLI

  def call
    puts "Welcome to Fresh Astrologer, a Rotten Tomatoes™ trivia game for the new-age film buff!"
    puts "----------"
    puts "These are the freshest movies in theaters:" 
    list_movie_titles
    puts "----------"
    get_user_movie
    get_actor_info
  end

  def list_movie_titles
    Scraper.new.scrape_wiki_for_birthday
    Movie.titles_arr.each_with_index {|movie, index| puts "#{index+1}. #{movie}"}
  end

  def get_user_movie
    puts "Which movie interests you? (enter number that corresponds with movie title)"
    movie_number = gets.strip
    movie_number
    @@movie_index = movie_number.to_i - 1
    @@chosen_title = Movie.all[@@movie_index].title
    if Movie.titles_arr.include? (@@chosen_title)
      get_actor_info
    else
      puts "Invalid entry!"
      get_user_movie
    end
  end

  def get_actor_info
    @@lead_role = Movie.all[@@movie_index].lead_actor
    puts "----------"
    puts "You've chosen #{@@chosen_title}. Great choice!"
    if @@lead_role == nil
      puts "Unfortunately, we do not have further information for #{@@chosen_title} at this time."
      puts "Please choose another movie."
      get_user_movie
    else 
      puts "Would you like to guess who the lead actor is? (enter y or n)"
      guess = gets.strip
      guess
      if guess == "y" || guess == "Y" || guess == "yes" || guess == "Yes"
        puts "Enter actor's name below:"
        @actor_name = gets.strip
        @actor_name
        if @@lead_role == @actor_name
          puts "----------"
          puts "That's right! You're a film trivia genius!"
          get_star_sign
        else
          puts "Unfortunately, that's incorrect. The correct answer is #{@@lead_role}"
          get_star_sign
        end
      elsif guess == "n" || guess == "N" || guess == "no" || guess == "No"
        puts "No shame in that game! The lead actor in #{@@chosen_title} is #{@@lead_role}"
        get_star_sign
      elsif guess == "exit" || guess == "end" || guess == "!"
        exit
      else
        puts "invalid entry"
        get_actor_info
      end
    end
  end

  def get_star_sign
    Actor.all.each do |actor| 
      if actor.name == @@lead_role
        @starz_sign = actor.star_sign_finder
      end
    end
    sign_arr = ["Aquarius", "Pisces", "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn"]
    puts "----------"
    puts "Time to guess #{@@lead_role}'s star sign to become a film trivia GOD!"
    sign_arr.each_with_index {|sign, index| puts "#{index+1}. #{sign}"}
    puts "Please enter one of the signs above by number:"
    sign_guess = gets.strip
    sign_guess
    @@sign_index = sign_guess.to_i - 1
    @@chosen_sign = sign_arr[@@sign_index]
    if @@chosen_sign == @starz_sign || @@chosen_sign == @starz_sign.downcase
      puts "That's correct! You are a true FILM TRIVIA GOD. All stand in awe of your power and majesty."
    else
      puts "Incorrect. You lose."
    end
  end

end
