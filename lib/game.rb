class Game

  def initialize
    @computer = Player.new()
    @player = Player.new()
  end


  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render

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


  def play
    game_over = false

    while (!game_over)

      self.display_boards
      @player.take_turn
      @computer.take_turn

      if (@player.all_ships_sunk? || @computer.all_ships_sunk?)
        game_over = true
      end
    end

    self.end_game
  end


  def end_game

  end




end
