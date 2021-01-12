class Actor
    attr_accessor :name, :fresh_movie, :birthday
    attr_reader :star_sign

    @@all = []
    
    def initialize(name, birthday, fresh_movie)
        @name = name
        @birthday = birthday
        @fresh_movie = fresh_movie
        save
    end
 
    def star_sign
        # .map{|date| date.strftime("(%Y-%m-%d)")}
        astro_hash = 
            {aquarius: ["01-20".."02-18"], 
             pisces: ["02-19".."03-20"], 
             aries: ["03-21".."04-19"],
             taurus: ["04-20".."05-20"],
             gemini: ["05-21".."06-20"],
             cancer: ["06-21".."07-22"],
             leo: ["07-23".."08-22"],
             virgo: ["08-23".."09-22"],
             libra: ["09-23".."10-22"],
             scorpio: ["10-23".."11-21"],
             sagittarius: ["11-22".."12-21"],
             capricorn: ["12-22".."01-19"]
            }
        astro_hash.each do |key, array|
            if array.include?(self.birthday)
                puts "#{self.name} is a #{key}"
            end
        end 
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
 
 end