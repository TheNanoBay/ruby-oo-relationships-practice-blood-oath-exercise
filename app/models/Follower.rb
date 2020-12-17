
class Follower
    @@all = []

    attr_accessor :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    # takes in an argument of a Cult instance and
    # adds this follower to the cult's list of followers

    def join_cult(cult_instance)
        todays_date = Time.new
        todays_date = todays_date.strftime("%F")
        BloodOath.new(todays_date, cult_instance, self)
    end


    #returns to us an array of bloodoaths that occur with this follower
    def bloodoaths
        BloodOath.all.select { |bloodoath| bloodoath.follower_instance == self }
    end


    #it gives us the cults instances
    def cults
        bloodoaths.map { |current_bloodoath| current_bloodoath.cult_instance }
    end

    def self.all
        @@all
    end


    def self.of_a_certian_age(age_int)
        self.all.select do |follower|
            follower.age == age_int
        end
    end


#-----------------Advanced Methods---------------------------

    #instance method that prints out all of the slogans for this follower's cults
    def my_cults_slogans 
        cults.map{ |cult| cult.slogan }
    end 

    #class method that returns the Follower instance who has joined the most cults
    def self.most_active 
        self.all.max_by{|follower| follower.cults.length}
        #max_by compares the numbers for all the followers cults lengths in the entire array and returns the one with the highest number 
    end

    def self.top_ten
        self.all.max_by(10){|follower| follower.cults.length}
    end


end







