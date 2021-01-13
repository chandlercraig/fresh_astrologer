class Actor
    attr_accessor :name, :fresh_movie, :birthday

    @@all = []
    
    def initialize(name, birthday, fresh_movie)
        @name = name
        @birthday = birthday
        @fresh_movie = fresh_movie
        save
    end
 
    def star_sign_finder
        sign = []
        astro_hash = 
            {Aquarius: (Date.parse('20-1-2020')..Date.parse('18-2-2020')).map{|date| date.strftime("%m-%d")},
             Pisces: (Date.parse('19-2-2020')..Date.parse('20-3-2020')).map{|date| date.strftime("%m-%d")}, 
             Aries: (Date.parse('21-3-2020')..Date.parse('19-4-2020')).map{|date| date.strftime("%m-%d")},
             Taurus: (Date.parse('20-4-2020')..Date.parse('20-5-2020')).map{|date| date.strftime("%m-%d")},
             Gemini: (Date.parse('21-5-2020')..Date.parse('20-6-2020')).map{|date| date.strftime("%m-%d")},
             Cancer: (Date.parse('21-6-2020')..Date.parse('22-7-2020')).map{|date| date.strftime("%m-%d")},
             Leo: (Date.parse('23-7-2020')..Date.parse('22-8-2020')).map{|date| date.strftime("%m-%d")},
             Virgo: (Date.parse('23-8-2020')..Date.parse('22-9-2020')).map{|date| date.strftime("%m-%d")},
             Libra: (Date.parse('23-9-2020')..Date.parse('22-10-2020')).map{|date| date.strftime("%m-%d")},
             Scorpio: (Date.parse('23-10-2020')..Date.parse('21-11-2020')).map{|date| date.strftime("%m-%d")},
             Sagittarius: (Date.parse('22-11-2020')..Date.parse('21-12-2020')).map{|date| date.strftime("%m-%d")},
             Capricorn: (Date.parse('22-12-2020')..Date.parse('19-1-2021')).map{|date| date.strftime("%m-%d")}
            }
        astro_hash.each do |key, array|
            if array.include?(self.birthday.match(/.....$/).to_s)
                sign << "#{key}"
                sign[0]
            elsif self.birthday == nil || self.birthday == ""
                puts "#{self.name} has asked the cosmos to keep their star sign confidential."
                # puts "Would you like to choose another actor?", then loops back to actor list
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