require './lib/board'


# An instance of Player will contain a board object and an array of ships.
# Through methods, a player object can place their ships (or have it randomly done for them),
# take a shot on a valid cell(or have it randomly done for them), get shot on a specified cell,
# check and return which cells have not yet been fired upon, and check and return
# whether all their ships have sunk.
class Player
    attr_reader :board,
                :ships

  def initialize
  @board = Board.new
  @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

# This method returns a String that prompts the user to place
# their ships on the board.
  def welcome
    "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long.\n" +
    @board.render
  end

#This method will fire upon the cell specified by the argument passed in. It
#then returns the rendered version of that cell ("X", "M", etc.)
  def get_shot(key)
    @board.cells[key].fire_upon
    return @board.cells[key].render
  end

  #This method will take user input and use it to determine where on the board
  #the ships should be placed
  def place_ships
    #Do this process for every ship
    @ships.each do |ship|
      ship_placed = false
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      #Do this until user input is valid and the ship is placed
      while (!ship_placed)
        input = gets.chomp
        user_coordinates = input.split(" ")
        #Translate the String passed in by the user to cells on the board
        user_cells = []
          user_coordinates.each do |user_coordinate|
          if @board.valid_coordinate?(user_coordinate)
              user_cells << @board.cells[user_coordinate]
          end
        end
        #Check if the cells associated with the passed in coordinates are a valid
        #placement for the current ship
        if (@board.valid_placement?(ship, user_cells))
          @board.place(ship, user_cells)
          puts @board.render(true)
          ship_placed = true
        else
          puts "Those are invalid coordinates. Please try again:"
        end
      end
    end
  end

 #This method randomly places the ships on a valid position of the board
  def random_place_ships
    @ships.each do|ship|  
      options = ["vertical", "horizontal"]
      choice = options.sample(1)[0]
      case choice 
      when "vertical"
          column = ("1".."4").to_a.sample(1)[0]
          rows = ("A".."D").each_cons(ship.length).to_a.sample(1)[0]
          cells = []
          rows.each do|row|
            cells << @board.cells[row + column]
          end
          @board.place(ship, cells)
      when "horizontal"
        row = ["A", "B", "C", "D"].sample(1)[0]
        columns = ("1".."4").each_cons(ship.length).to_a.sample(1)[0]
        cells = []
        columns.each do|column|
          cells << @board.cells[row + column]
        end
        @board.place(ship, cells)
      end
    end  
  end

  #This method will return a string representing the coordinate the player wishes
  #to fire on. It takes an array of strings as a parameter, representing coordinates yet to be fired upon.
  #The method checks if the user input is included in the array, and if so, returns the users input.
  def take_shot(unfired_upon_coordinates)
    invalid_input = true
    puts "Enter a coordinate for your shot."
    input = ""
    while (invalid_input)
      input = gets.chomp
      if (unfired_upon_coordinates.include?(input))
        invalid_input = false
      else
        puts "Please enter a valid coordinate:"
      end
    end
    return input
  end

 #This method randomly returns a String representing a coordinate to be fired upon.
 #It uses the sample method on the array passed in, and returns the value.
  def random_take_shot(unfired_upon_coordinates)
    return unfired_upon_coordinates.sample(1)[0]
  end

  #This method loops through all ships in the @ships array, and return true if
  #every ship has been sunk.
  def all_ships_sunk?
    ships_sunk = []
    @ships.each do |ship|
      if (ship.sunk?)
        ships_sunk << ship
      end
    end
    ships_sunk.count == @ships.count
  end

  #This method loops through all cells on the board and returns an array containing
  #every coordinate unfired upon
  def coordinates_unfired_upon
    coordinates = []
    @board.cells.each do |coordinate, cell|
      if (!cell.fired_upon?)
        coordinates << coordinate
      end
    end
    return coordinates
  end

end
