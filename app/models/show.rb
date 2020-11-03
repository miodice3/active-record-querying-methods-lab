require 'pry'
class Show < ActiveRecord::Base

    def self.highest_rating
        #binding.pry
        Show.all.maximum :rating
    end

    def self.most_popular_show
 #       binding.pry
        var = {}
        var[:rating] = Show.all.maximum :rating
        Show.find_or_create_by(var)
#        var.name

    end

    def self.lowest_rating
        var = Show.all.minimum :rating
    end

    def self.least_popular_show
        var = {}
        var[:rating] = Show.all.minimum :rating
        Show.find_or_create_by(var)
    end

    def self.ratings_sum
        Show.sum("rating")
    end

    def self.popular_shows
        Show.where("rating > 5")
    end

    def self.shows_by_alphabetical_order
        Show.all.order(name: :ASC)
    end

end

# => [#<Show:0x00007fed2e4e3bf8 id: 14, name: "Rick and Morty", network: "Adult Swim", day: "Thursday", rating: 10, season: nil>,
#  #<Show:0x00007fed2e4e3978 id: 15, name: "Law & Order", network: "NBC", day: "Monday", rating: 7, season: nil>,
#  #<Show:0x00007fed2e4e3568 id: 16, name: "The Cleveland Show", network: "Fox", day: "Monday", rating: 2, season: nil>,
#  #<Show:0x00007fed2e4e3220 id: 17, name: "Fear the Walking Dead", network: "AMC", day: "Sunday", rating: 3, season: nil>]