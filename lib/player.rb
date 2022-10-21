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

  def take_hit(cell_key)
    @board[cell_key].fire_upon.render
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


  def take_turn
    
  end


  def random_take_turn
    vaild_cells = @board.cells.map do |cell|
      if (!cell.fired_upon?)
        cell

      end
    end
    random_choice = valid_cells.sample.key
  end


  def all_ships_sunk?
    ships_sunk = @ships.map do |ship|
      if (ship.sunk?)
        ship
      end
    end
    ships_sunk.count == @ships.count
  end

end
