class Ship
    attr_reader :name,
                :length,
                :health

    def initialize (name, length)
        @name = name
        @length = length
        @health = length
    end

    #Method for checking if the ships' health points reached 0
    def sunk?

        health == 0

    end

    #Method for reducing ship health points by 1
    def hit
        
        @health = (health - 1)

    end

end