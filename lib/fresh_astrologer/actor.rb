class Actor
    attr_accessor :name, :movie, :birthday
    attr_reader :star_sign

    @@all = []
    
    def initialize(name, birthday)
        @name = name
        @birthday = birthday
        save
    end
 
    def star_sign
        # sign variables will equal date ranges
        # if aquarius.include?(self.birthday)
        #     puts "#{self.name} is an aquarius"
        #  elsif pisces.include?(self.birthday)
        #     puts "#{self.name} is a pisces"
        #  elsif aries.include?(self.birthday)
        #     puts "#{self.name} is an aries"
        #  elsif taurus.include?(self.birthday)
        #     puts "#{self.name} is a taurus"
        #  elsif gemini.include?(self.birthday)
        #     puts "#{self.name} is a gemini"
        #  elsif cancer.include?(self.birthday)
        #     puts "#{self.name} is a cancer"
        #  elsif leo.include?(self.birthday)
        #     puts "#{self.name} is a leo"
        #  elsif virgo.include?(self.birthday)
        #     puts "#{self.name} is a virgo"
        #  elsif libra.include?(self.birthday)
        #     puts "#{self.name} is a libra"
        #  elsif scorpio.include?(self.birthday)
        #     puts "#{self.name} is a scorpio"
        #  elsif sagittarius.include?(self.birthday)
        #     put "#{self.name} is a sagittarius"
        #  elsif capricorn.include?(self.birthday)
        #     put "#{self.name} is a capricorn"
        # end       
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
 
 end