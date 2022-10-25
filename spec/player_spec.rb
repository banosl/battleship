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
    it 'does stuff' do

    end
  end

  describe '#get_shot' do
    it 'does stuff' do

    end
  end

  # describe '#place_ships' do
  #   it 'does stuff' do
  #
  #   end
  # end

  describe '#random_place_ships' do
    it 'does stuff' do

    end
  end

  # describe '#take_shot' do
  #   it 'does stuff' do
  #
  #   end
  # end

  describe '#random_take_shot' do
    it 'does stuff' do

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
