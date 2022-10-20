class Player

  def initialize

  @board = Board.new
  @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]

  end


  def player_welcome

    "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long.\n" +
    @board.render

  end


  def place_ships
    cruiser_placed = false
    sub_placed = false

    puts "Enter the squares for the Cruiser (3 spaces):"
    user_cells = []
    while (!cruiser_placed)
      input = gets.chomp
      user_coordinates = input.split(" ")
      user_cells = user_coordinates.map do |coordinate|
        @board.cells[coordinate]
      end

      if (@board.valid_placement(@ships[0], user_cells))
        board.place(@ship[0], user_cells)
        puts board.render(true)
        cruiser_placed = true
      else
        puts "Those are invalid coordinates. Please try again:"
      end
    end

    puts "Enter the squares for the Submarine (2 spaces):"
    while (!sub_placed)
      input = gets.chomp
      user_coordinates = input.split(" ")
      user_cells = user_coordinates.map do |coordinate|
        @board.cells[coordinate]
      end

      if (@board.valid_placement(@ships[1], user_cells))
        board.place(@ship[1], user_cells)
        puts board.render(true)
        sub_placed = true
      else
        puts "Those are invalid coordinates. Please try again:"
      end
    end
  end


end
