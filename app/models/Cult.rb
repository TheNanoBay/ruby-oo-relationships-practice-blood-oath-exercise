
class Cult

    @@all = []

    attr_accessor :name, :location, :founding_year, :slogan

    #name -> string . #location -> string, #founding_year -> Int, #slogan -> string

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end 

    #takes in an argument of a Follower instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        todays_date = Time.new 
        todays_date = todays_date.strftime("%F")
        new_bloodOath = BloodOath.new(todays_date, self, follower)
    end 

    #returns to us an array of bloodoaths that occur with this cult 
    def bloodoaths
        BloodOath.all.select{|bloodoath| bloodoath.cult_instance == self}
    end 

    #out of all the blood oaths that are returned to us from the previous method... it gives us the follower instances 
    def followers 
        bloodoaths.map{|current_bloodoath| current_bloodoath.follower_instance}
    end


    #returns an Integer that is the number of followers in this cult
    def cult_population
        followers.length
    end 

    #returns an Array of all the cults
    def self.all 
        @@all
    end
    #takes a String argument that is a name and returns a Cult instance whose name matches that argument
    def self.find_by_name(cult_name) 
        self.all.find {|cult| cult.name == cult_name}
    end 

    def self.find_by_location(location_string)
        self.all.select {|cult| cult.location == location_string}
    end 

    def self.find_by_founding_year(year_int)
        self.all.select{|cult| cult.founding_year == year_int}
    end

    #-----------Advanced Methods----------------------------------


    def average_age
        avg_age = followers.map do |follower|
            follower.age
        end
        sum = avg_age.sum
        sum / avg_age.length
    end

    def my_followers_mottos
        puts followers.map{|followers| followers.life_motto}
    end

    def self.least_popular
        self.all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location 
        location_array = self.all.map{|cult| cult.location}
        location_array.max_by{|location| location_array.count(location)}
    end


end 