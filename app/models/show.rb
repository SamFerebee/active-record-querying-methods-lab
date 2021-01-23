class Show < ActiveRecord::Base
    def self.highest_rating
        Show.maximum(:rating)
    end

    def self.most_popular_show
        #name = Show.all.max_by{|show| show.rating}
        Show.find_by(rating: Show.highest_rating)
    end

    def self.lowest_rating
        Show.minimum(:rating)
    end

    def self.least_popular_show
        #name = Show.all.min_by{|s| s.rating}
        Show.find_by(rating: Show.lowest_rating)
    end

    def self.ratings_sum
        Show.sum{|s| s.rating }
    end

    def self.popular_shows
       #Show.select{|s| s.rating > 5}
       Show.where("rating > ?", 5)
    end

    def self.shows_by_alphabetical_order
        Show.order(:name)
    end

end