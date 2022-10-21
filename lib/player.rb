class Player

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


  def place_ships

    @ships.each do |ship|
      ship_placed = false
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"

      while (!ship_placed)
        input = gets.chomp
        user_coordinates = input.split(" ")

        user_cells = user_coordinates.map do |coordinate|
          @board.cells[coordinate]
        end

        if (@board.valid_placement(@ships[ship], user_cells))
          board.place(@ship[ship], user_cells)
          puts board.render(true)
          ship_placed = true
        else
          puts "Those are invalid coordinates. Please try again:"
        end
      end
    end
  end

  def take_turn


  end



  def all_ships_sunk?


  end

end
