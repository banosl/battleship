require './lib/board'
require './lib/ship'

RSpec.describe Board do

#The Cells

#Test 1
    it 'board exists' do

        board = Board.new

        expect(board).to be_instance_of(Board)

    end

#Test 2
    it 'board has 16 cells' do

        board = Board.new

        expect(board.cells.count).to eq(16)
    end

#Validate Coordinates

#Test 3
    it 'Coordinates fall within the 16 possibilities' do

        board = Board.new


        expect(board.valid_coordinate?("A1")).to be true
        expect(board.valid_coordinate?("D4")).to be true
        expect(board.valid_coordinate?("A5")).to be false
        expect(board.valid_coordinate?("E1")).to be false
        expect(board.valid_coordinate?("A22")).to be false

    end

#Validate Placements

#Test 4
    it 'cruiser and submarine exist' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(cruiser).to be_instance_of(Ship)
        expect(submarine).to be_instance_of(Ship)

    end

#Test 5
    it 'cruiser should have 3 coordinates to match length' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)


        expect(board.valid_placement?(cruiser, [board.cells["A1"],board.cells["A2"]])).to be(false)

    end

#Test 6
    it 'submarine should have 2 coordinates to match length' do

        board = Board.new

        submarine = Ship.new("Submarine", 2)

        board.valid_placement?(submarine, [board.cells["A2"] ,board.cells["A3"] ,board.cells["A4"]])

        expect(board.valid_placement?(submarine,[board.cells["A2"] ,board.cells["A3"] , board.cells["A4"]])).to be false

    end

#Test 7
    it 'coordinates for each ship are consecutive' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        bool_1 = board.valid_placement?(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A4"]])
        bool_2 = board.valid_placement?(submarine, [board.cells["A1"], board.cells["C1"]])
        bool_3 = board.valid_placement?(cruiser, [board.cells["A3"], board.cells["A2"], board.cells["A1"]])
        bool_4 = board.valid_placement?(submarine, [board.cells["C1"], board.cells["B1"]])

        expect(bool_1).to be false
        expect(bool_2).to be false
        expect(bool_3).to be false
        expect(bool_4).to be false

    end

#Test 8
  it 'coordinates for ships are consecutive but cant be diagonal' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)



        expect(board.valid_placement?(cruiser, [board.cells["A1"], board.cells["B2"], board.cells["B3"]])).to be false
        expect(board.valid_placement?(submarine, [board.cells["C2"], board.cells["D3"]])).to be false

    end

#Test 9
    it 'coordinates are valid' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, [board.cells["A1"], board.cells["A2"]])).to be true
        expect(board.valid_placement?(cruiser, [board.cells["B1"], board.cells["C1"], board.cells["D1"]])).to be false

    end

#Placing Ships

#Test 10
    xit 'Ships are placed on the board and cells exist' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])

        expect(board.cells["A1"].empty?).to eq(false)

    end

#Test 11
    it 'The identified cells have the same ship object' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])



        expect(board.cells["A1"].ship).to eq(board.cells["A2"].ship)
    end

#Overlapping Ships

#Test 12
    xit 'The submarine cant be placed on the same cells as the cruiser' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place_ship(cruiser, ["A1", "A2", "A3"])

        submarine = Ship.new("Submarine", 2)

        board.valid_placement?(submarine, ["A1", "B1"])
        board.valid_placement?(submarine, ["C1", "C2"])

        expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
        expect(board.valid_placement?(submarine, ["C1", "C2"])).to be true

    end

#Rendering the Board

#Test 13
    xit 'A board renders without displaying ship placements' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place_ship(cruiser, ["A1", "A2", "A3"])

        board.render

        expect(board.render).to eq(
        "  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")

    end

#Test 14
    xit 'A board renders true with ship placements' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place_ship(cruiser, ["A1", "A2", "A3"])

        board.render(true)

        expect(board.render(true)).to eq(
        "  1 2 3 4 \n" +
        "A S S S . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")

    end

#Test 15
    xit 'A board renders with a ship being hit' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place_ship(cruiser, ["A1", "A2", "A3"])

        cell_1 = board.cells("A1")
        cell_2 = board.cells("A2")
        cell_3 = board.cells("A3")

        cell_1.fire_upon
        cell_2.fire_upon

        board.render

        expect(board.render).to eq(
        "  1 2 3 4 \n" +
        "A H H . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")

    end

end
