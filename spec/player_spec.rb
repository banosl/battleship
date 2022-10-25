require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

RSpec.describe Player do

  describe '#initialize' do
    xit 'does stuff' do

    end
  end

  describe '#welcome' do
    it 'prints the welcome message for the player' do
      player = Player.new
      player.welcome

      expect(player.welcome).to eq("I have laid out my ships on the grid.\n" +
      "You now need to lay out your two ships.\n" +
      "The Cruiser is three units long and the Submarine is two units long.\n" +
      "  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")
    end
  end

  describe '#get_shot' do
    it 'taking a coordinate it will fire_upon a cell and return the changed cell render value' do
      player = Player.new
      player.random_place_ships

      player.get_shot("A1")
      player.get_shot("A2")
      player.get_shot("B4")
      player.get_shot("C3")
      player.get_shot("D1")
      player.get_shot("D4")
      player.get_shot("C2")
      player.get_shot("B3")

      expect(player.get_shot("A1")).not_to include(".")
      expect(player.get_shot("A1")).not_to include("S")
      expect(player.get_shot("A2")).not_to include(".")
      expect(player.get_shot("A2")).not_to include("S")
      expect(player.get_shot("B4")).not_to include(".")
      expect(player.get_shot("B4")).not_to include("S")
      expect(player.get_shot("C3")).not_to include(".")
      expect(player.get_shot("C3")).not_to include("S")
      expect(player.get_shot("D1")).not_to include(".")
      expect(player.get_shot("D1")).not_to include("S")
      expect(player.get_shot("D4")).not_to include(".")
      expect(player.get_shot("D4")).not_to include("S")
      expect(player.get_shot("C2")).not_to include(".")
      expect(player.get_shot("C2")).not_to include("S")
      expect(player.get_shot("B3")).not_to include(".")
      expect(player.get_shot("B3")).not_to include("S")
    end
  end
 
  describe '#random_place_ships' do
    it 'ships are placed randomly for the computer so we cant have a board that is just dots' do
      player = Player.new
      player.random_place_ships
      
      expect(player.board.render(true)).not_to include("  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n")
    end
  end

  describe '#random_take_shot' do
    it 'computer will take a random shot and the return will mean that the cell cant be a . or S' do
      player = Player.new
      computer = Player.new
      player_unshot_coordinates = player.coordinates_unfired_upon
      computer_shot_coordinate = computer.random_take_shot(player_unshot_coordinates)
      computer_shot_result = player.get_shot(computer_shot_coordinate)

      expect(computer_shot_result).not_to include(".")
      expect(computer_shot_result).not_to include("S")
    end
  end

  describe '#all_ships_sunk?' do
    xit 'does stuff' do

    end
  end

  describe '#coordinates_unfired_upon' do
    xit 'does stuff' do
      

    end
    xit 'correctly returns coordinate' do

    end
  end

end