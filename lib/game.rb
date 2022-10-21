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


  def end_game
    if @player.all_ships_sunk?
      puts "Computer wins."
    else
      puts "You win."
    end

    self.start
  end


  def play
    game_over = false

    while (!game_over)

      self.display_boards

      player_shot = @player.random_take_turn
      computer_shot = @computer.random_take_turn

      player_shot_result = @comupter.take_hit(player_shot)
      computer_shot_result = @player.take_hit(computer_shot)

      puts turn_results("Your", player_shot, player_shot_result)
      puts turn_results("Computer", computer_shot, computer_shot_result)


      if (@player.all_ships_sunk? || @computer.all_ships_sunk?)
        game_over = true
      end
    end

    self.end_game
  end


  def start

    puts "Welcome to BATTLESHIP \n" +
         "Enter p to play. Enter q to quit.\n"

    user_input = gets.chomp

    if (user_input == "p")
      @computer.place_ships

      puts @player.welcome
      @player.place_ships


      self.play

    else
      return
    end

  end
end
