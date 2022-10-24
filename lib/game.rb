class Game

  def initialize
    @computer = Player.new()
    @player = Player.new()
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def turn_results(player, cell, rendered_cell)
    case rendered_cell
    when "M"
      "#{player} shot on #{cell} was a miss."
    when "H"
      "#{player} shot on #{cell} was a hit."
    when "X"
      "#{player} shot on #{cell} was a hit. The ship has been sunk."
    end
  end

  def start

    puts "Welcome to BATTLESHIP \n" +
         "Enter p to play. Enter q to quit.\n"
    user_input = gets.chomp

    if (user_input == "p" || user_input == "P")
      @computer.place_ships
      puts @player.welcome
      @player.place_ships
      self.play
    else
      return
    end
  end

  def play

    game_over = false
    while (!game_over)
      self.display_boards

      player_unshot_coordinates = @player.coordinates_unfired_upon
      computer_unshot_coordinates = @computer.coordinates_unfired_upon

      player_shot_coordinate = @player.take_shot(computer_unshot_coordinates)
      computer_shot_coordinate = @computer.random_take_shot(player_unshot_coordinates)

      player_shot_result = @computer.get_shot(player_shot_coordinate)
      computer_shot_result = @player.get_shot(computer_shot_coordinate)

      puts turn_results("Your", player_shot_coordinate, player_shot_result)
      puts turn_results("Computer", computer_shot_coordinate, computer_shot_result)


      if (@player.all_ships_sunk? || @computer.all_ships_sunk?)
        game_over = true
      end
    end
    self.end_game
  end

  def end_game
    if @player.all_ships_sunk?
      puts "Computer wins."
    else
      puts "You win."
    end
    self.start
  end
end
