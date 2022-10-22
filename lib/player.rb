require './lib/board'

class Player
    attr_reader :board,
                :ships

  def initialize

  @board = Board.new
  @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]

  end


  def welcome

    "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long.\n" +
    @board.render

  end

  def take_hit(key)
    @board.cells[key].fire_upon
    return @board.cells[key].render
  end

  def place_ships

    @ships.each do |ship|
      ship_placed = false
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"

      while (!ship_placed)
        input = gets.chomp
        user_coordinates = input.split(" ")

        user_cells = []
          user_coordinates.each do |user_coordinate|
          if @board.valid_coordinate?(user_coordinate)
              user_cells << @board.cells[user_coordinate]
          end
        end

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


  def random_place_ships

  end


  def take_shot(unfired_upon_coordinates)
    invalid_input = true
    puts "Enter coordinate for your shot."
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


  def random_take_shot(unfired_upon_coordinates)
    return unfired_upon_coordinates.sample(1)[0]
  end


  def all_ships_sunk?
    ships_sunk = []
    @ships.each do |ship|
      if (ship.sunk?)
        ships_sunk << ship
      end
    end
    ships_sunk.count == @ships.count
  end


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
