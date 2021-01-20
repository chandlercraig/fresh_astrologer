class FreshAstrologer::CLI

  def call
    puts " "
    puts "Welcome to Fresh Astrologer, a Rotten Tomatoes™ trivia game for the new-age film buff!"
    puts " "
    puts "Please wait while we find the highest reviewed movies in theaters now."
    puts " "
    puts "----------"
    puts " "
    list_movie_titles
    puts " "
    puts "----------"
    puts " "
    get_movie
  end

  def goodbye
    puts "Come back again soon! The stars thank you."
    puts " "
    exit
  end

  def list_movie_titles
    FreshAstrologer::Scraper.new.scrape_wiki_for_birthday
    Movie.titles_arr.each_with_index {|movie, index| puts "#{index+1}. #{movie}"}
  end

  def get_movie
    puts "Above is a Rotten Tomatoes list of the freshest movies currently in theaters."
    puts " "
    puts "Which movie interests you? (enter number that corresponds with movie title)"
    movie_number = gets.strip
    @@movie_index = movie_number.to_i - 1
    @@chosen_title = Movie.all[@@movie_index].title
    if movie_number == "exit" || movie_number == "Exit" || movie_number == "!"
      goodbye
    elsif Movie.titles_arr.include? (@@chosen_title)
      get_actor
    elsif !Movie.titles_arr.include? (@@chosen_title)
      puts "Invalid entry!"
      get_movie
    end
  end

  def get_actor
    @@lead_role = Movie.all[@@movie_index].lead_actor
    puts " "
    puts "----------"
    puts " "
    puts "You've chosen #{@@chosen_title}. Great choice!"
    if @@lead_role == nil
      puts "Unfortunately, we do not have further information for #{@@chosen_title} at this time."
      puts "Please choose another movie."
      get_movie
    else 
      puts "Would you like to guess who the lead actor is? (enter y or n)"
      guess = gets.strip
      if guess == "exit" || guess == "Exit" || guess == "!"
        goodbye
      elsif guess == "y" || guess == "Y" || guess == "yes" || guess == "Yes"
        puts "Enter actor's name below:"
        @actor_name = gets.strip
        if @@lead_role == @actor_name
          puts " "
          puts "----------"
          puts " "
          puts "That's right! You're a film trivia genius!"
          get_star_sign
        elsif @actor_name == "exit" || @actor_name == "Exit" || @actor_name == "!"
          goodbye
        else
          puts "Unfortunately, that's incorrect. The correct answer is #{@@lead_role}"
          get_star_sign
        end
      elsif guess == "n" || guess == "N" || guess == "no" || guess == "No"
        puts " "
        puts "----------"
        puts " "
        puts "No shame in that game."
        get_star_sign
      else
        puts "invalid entry"
        get_actor
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
    puts " "
    puts "----------"
    puts " "
    sign_arr.each_with_index {|sign, index| puts "#{index+1}. #{sign}"}
    puts " "
    puts "----------"
    puts " "
    puts "#{@@lead_role} is the lead actor in #{@@chosen_title}."
    puts "Time to guess #{@@lead_role}'s star sign to become a film trivia GOD!"
    puts " "
    puts "----------"
    puts " "
    puts "Please enter one of the signs above by number:"
    sign_guess = gets.strip
    @@sign_index = sign_guess.to_i - 1
    @@chosen_sign = sign_arr[@@sign_index]
    if sign_guess == "exit" || sign_guess == "Exit" || sign_guess == "!"
      goodbye
    elsif @starz_sign == nil
      puts "#{@@lead_role} has asked the cosmos to keep their star sign confidential."
      goodbye
    elsif @@chosen_sign == @starz_sign || @@chosen_sign == @starz_sign.downcase
      puts " "
      puts "----------"
      puts " "
      puts "That's CORRECT!!! You are a true FILM TRIVIA GOD. All stand in awe of your power and majesty."
      puts " "
    else
      puts "That answer was incorrect, but it's okay! This game is pretty hard :)"
    end
    goodbye
  end

end
