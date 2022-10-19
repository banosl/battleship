require './lib/board'
require './lib/ship'

RSpec.describe Board do

#The Cells

#Test 1
    it 'board exists' do

        board = Board.new

        expect(board)to be_instance_of(Board)

    end

#Test 2
    it 'board has 16 cells' do
       
        board = Board.new

        cell_1 = board.cells("A1")
        cell_2 = board.cells("A2")
        cell_3 = board.cells("A3")
        cell_4 = board.cells("A4")
        cell_5 = board.cells("B1")
        cell_6 = board.cells("B2")
        cell_7 = board.cells("B3")
        cell_8 = board.cells("B4")
        cell_9 = board.cells("C1")
        cell_10 = board.cells("C2")
        cell_11 = board.cells("C3")
        cell_12 = board.cells("C4")
        cell_13 = board.cells("D1")
        cell_14 = board.cells("D2")
        cell_15 = board.cells("D3")
        cell_16 = board.cells("D4")


        expect(board.cells)to eq({"A1" => cellobject, ...})

    end

#Validate Coordinates

#Test 3
    it 'Coordinates fall within the 16 possibilities' do

        board = Board.new

        cell_1 = board.cells("A1")
        cell_2 = board.cells("A2")
        cell_3 = board.cells("A3")
        cell_4 = board.cells("A4")
        cell_5 = board.cells("B1")
        cell_6 = board.cells("B2")
        cell_7 = board.cells("B3")
        cell_8 = board.cells("B4")
        cell_9 = board.cells("C1")
        cell_10 = board.cells("C2")
        cell_11 = board.cells("C3")
        cell_12 = board.cells("C4")
        cell_13 = board.cells("D1")
        cell_14 = board.cells("D2")
        cell_15 = board.cells("D3")
        cell_16 = board.cells("D4")

        board.valid_coordinate?("A1")
        board.valid_coordinate?("D4")
        board.valid_coordinate?("A5")
        board.valid_coordinate?("E1")
        board.valid_coordinate?("A22")

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

        board.valid_placement?(cruiser, ["A1","A2"])

        expect(board.valid_placement?(cruiser,["A1","A2"])).to be false

    end

#Test 6
    it 'submarine should have 2 coordinates to match length' do

        board = Board.new

        submarine = Ship.new("Submarine", 2)

        board.valid_placement?(submarine, ["A2","A3","A4"])

        expect(board.valid_placement?(submarine,["A2","A3", "A4"])).to be false

    end

#Test 7
    it 'coordinates for each ship are consecutive' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.valid_placement?(cruiser, ["A1", "A2", "A4"])
        board.valid_placement?(submarine, ["A1", "C1"])
        board.valid_placement?(cruiser, ["A3", "A2", "A1"])
        board.valid_placement?(submarine, ["C1", "B1"])

        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false

    end

#Test 8
    it 'coordinates for ships are consecutive but cant be diagonal' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.valid_placement?(cruiser ["A1", "B2", "B3"])
        board.valid_placement?(submarine, ["C2", "D3"])

        expect(board.valid_placement?(cruiser ["A1", "B2", "B3"])).to be false
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false

    end

#Test 9
    it 'coordinates are valid' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.valid_placement?(submarine, ["A1", "A2"])
        board.valid_placement?(cruiser, ["B1", "C1", "D1"])

        expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true

    end

#Placing Ships

#Test 10
    it 'Ships are placed on the board and cells exist' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place_ship(cruiser, ["A1", "A2", "A3"])

        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]

        expect(cell_1).to be_instance_of(Cell)
        expect(cell_2).to be_instance_of(Cell)
        expect(cell_3).to be_instance_of(Cell)

    end

#Test 11
    it 'The identified cells have the same ship object' do

        board = Board.new

        cruiser = Ship.new("Cruiser", 3)

        board.place_ship(cruiser, ["A1", "A2", "A3"])

        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]

        cell_1.ship
        cell_2.ship
        cell_3.ship

        cell_3.ship == cell_2.ship
        cell_1.ship == cell_2.ship

        expect(cell_3.ship == cell_2.ship).to be true
        expect(cell_1.ship == cell_2.ship).to be true

    end

#Overlapping Ships

#Test 12
    it 'The submarine cant be placed on the same cells as the cruiser' do

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
    it 'A board renders without displaying ship placements' do

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
    it 'A board renders true with ship placements' do

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
    it 'A board renders with a ship being hit' do

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