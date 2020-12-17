
class BloodOath

    @@all = []
    attr_accessor :initiation_date
    attr_reader :cult_instance, :follower_instance
    # returns a String that is the initiation date of this blood oath
    # in the format YYYY-MM-DD


    def initialize(initiation_date, cult_instance, follower_instance)
        @initiation_date = initiation_date
        @cult_instance = cult_instance
        @follower_instance = follower_instance

        @@all << self
    end


    def self.all
        @@all
    end


end
