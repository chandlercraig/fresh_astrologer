class Actor
    attr_reader :name, :fresh_movie, :birthday

    @@all = []
    
    def initialize(name, birthday, fresh_movie)
        @name = name
        @birthday = birthday
        @fresh_movie = fresh_movie
        save
    end

    def create_date_ranges
        @astro_hash = 
            {aquarius: ['20-1-2020', '18-2-2020'],
             pisces: ['19-2-2020', '20-3-2020'], 
             aries: ['21-3-2020', '19-4-2020'],
             taurus: ['20-4-2020', '20-5-2020'],
             gemini: ['21-5-2020', '20-6-2020'],
             cancer: ['21-6-2020', '22-7-2020'],
             leo: ['23-7-2020', '22-8-2020'],
             virgo: ['23-8-2020', '22-9-2020'],
             libra: ['23-9-2020', '22-10-2020'],
             scorpio: ['23-10-2020', '21-11-2020'],
             sagittarius: ['22-11-2020', '21-12-2020'],
             capricorn: ['22-12-2020', '19-1-2021'],
            }
        @astro_hash.each do |key, arr|
            date_range = (Date.parse("#{arr[0]}")..Date.parse("#{arr[1]}")).map{|date| date.strftime("%m-%d")}
            @astro_hash[key] = date_range
        end
    end
 
    def star_sign_finder
        create_date_ranges
        sign = []
        @astro_hash.each do |key, arr|
            arr.each {|el| sign << "#{key}".capitalize if el == self.birthday.match(/.....$/).to_s}
        end
        return sign[0]
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
 
 end