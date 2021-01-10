class Movie
    attr_accessor :title, :lead_actor, :titles_arr

    @@all = []
    @@titles_arr = []

    def initialize (title, lead_actor)
        @title = title
        @lead_actor = lead_actor
        save
    end

    def self.all
        @@all
    end

    def self.titles_arr
        @@titles_arr
    end

    def save
        @@all << self
    end

end