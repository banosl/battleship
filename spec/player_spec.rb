require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

RSpec.describe Player do
#Ryan
  describe '#initialize' do
    xit 'does stuff' do

    end
  end

  #Leo
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

  #leo
  describe '#get_shot' do
    xit 'taking a coordinate it will fire_upon a cell and render the change' do
      player = Player.new
      player.get_shot("A1")

    end
  end

 
  # describe '#place_ships' do
  #   it 'does stuff' do

  #   end
  # end

  #Leo
  describe '#random_place_ships' do
    xit 'does stuff' do

    end
  end

  # describe '#take_shot' do
  #   it 'does stuff' do

  #   end
  # end

  #Leo
  describe '#random_take_shot' do
    xit 'does stuff' do

    end
  end
#Ryan
  describe '#all_ships_sunk?' do
    xit 'does stuff' do

    end
  end
#Ryan
  describe '#coordinates_unfired_upon' do
    xit 'does stuff' do

    end
    xit 'correctly returns coordinate' do

    end
  end



end