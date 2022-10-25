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

        expect(board.valid_placement?(submarine,[board.cells["A2"] ,board.cells["A3"] , board.cells["A4"]])).to be false
    end

#Test 7
    it 'coordinates for each ship are consecutive' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A4"]])).to be false
        expect(board.valid_placement?(submarine, [board.cells["A1"], board.cells["C1"]])).to be false
        expect(board.valid_placement?(cruiser, [board.cells["A3"], board.cells["A2"], board.cells["A1"]])).to be false
        expect(board.valid_placement?(submarine, [board.cells["C1"], board.cells["B1"]])).to be false
    end

#Test 8

    it 'coordinates for ships are consecutive but cant be diagonal' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, [board.cells["A1"], board.cells["B2"], board.cells["B3"]])).to be(false)
        expect(board.valid_placement?(submarine, [board.cells["C2"], board.cells["D3"]])).to be(false)
    end

#Test 9
    it 'coordinates are valid' do
        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, [board.cells["A1"], board.cells["A2"]])).to be true
        expect(board.valid_placement?(cruiser, [board.cells["B1"], board.cells["C1"], board.cells["D1"]])).to be true
    end

#Placing Ships

#Test 10
    it 'Ships are placed on the board and cells exist' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])

        expect(board.cells["A1"].empty?).to eq(false)
        expect(board.cells["A2"].empty?).to eq(false)
        expect(board.cells["A3"].empty?).to eq(false)
    end

#Test 11
    it 'The identified cells have the same ship object' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])

        expect(board.cells["A1"].ship).to eq(board.cells["A2"].ship)
        expect(board.cells["A1"].ship).to eq(board.cells["A3"].ship)
    end

#Overlapping Ships

#Test 12
    it 'The submarine cant be placed on the same cells as the cruiser' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        
        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])

        expect(board.valid_placement?(submarine, [board.cells["A1"], board.cells["B1"]])).to be false
        expect(board.valid_placement?(submarine, [board.cells["C1"], board.cells["C2"]])).to be true
    end

#Rendering the Board

#Test 13

    it 'A board renders without displaying ship placements' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])

        board.render

        expect(board.render).to eq(
        "  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")
    end

#Test 14

    it 'A board renders true with ship placements' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])

        expect(board.render(true)).to eq(
        "  1 2 3 4 \n" +
        "A S S S . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")

    end

#Test 15

    it 'A board renders with a ship being sunk, a sub hit and a couple missed shots' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine",2)

        board.place(cruiser, [board.cells["A1"], board.cells["A2"], board.cells["A3"]])
        board.place(submarine, [board.cells["B3"], board.cells["B4"]])

        board.cells["A1"].fire_upon
        board.cells["A2"].fire_upon
        board.cells["A3"].fire_upon
        board.cells["B3"].fire_upon
        board.cells["D3"].fire_upon
        board.cells["D4"].fire_upon
        
        expect(board.render).to eq(
        "  1 2 3 4 \n" +
        "A X X X . \n" +
        "B . . H . \n" +
        "C . . . . \n" +
        "D . . M M \n")
    end

end
