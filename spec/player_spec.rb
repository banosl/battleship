require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

require 'RSpec'

describe Player do

  describe '#initialize' do
    it 'exists and is instantiated correctly' do
      player = Player.new

      expect(player).to be_instance_of(Player)
      expect(player.board).to be_instance_of(Board)
      expect(player.ships.count).to eq(2)
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

    it 'returns true only once all ships are sunk' do
      player = Player.new
      player.ships[0].hit
      player.ships[0].hit
      player.ships[0].hit

      expect(player.all_ships_sunk?).to eq(false)

      player.ships[1].hit
      player.ships[1].hit
      expect(player.all_ships_sunk?).to eq(true)
    end
  end

  describe '#coordinates_unfired_upon' do

    it 'correctly returns every cell unfired upon' do
      player = Player.new

      expect(player.coordinates_unfired_upon).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])

      player.board.cells["A1"].fire_upon
      player.board.cells["A2"].fire_upon
      player.board.cells["A3"].fire_upon
      player.board.cells["A4"].fire_upon

      expect(player.coordinates_unfired_upon).to eq(["B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
    end
  end
end
