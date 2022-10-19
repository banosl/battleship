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

        board.cells("A1")
        board.cells("A2")
        board.cells("A3")
        board.cells("A4")
        board.cells("B1")
        board.cells("B2")
        board.cells("B3")
        board.cells("B4")
        board.cells("C1")
        board.cells("C2")
        board.cells("C3")
        board.cells("C4")
        board.cells("D1")
        board.cells("D2")
        board.cells("D3")
        board.cells("D4")


        expect(board.cells)to eq({"A1" => cellobject, ...})

    end

#Validate Coordinates

#Test 3
    it 'Coordinates fall within the 16 possibilities' do

        board = Board.new

        board.cells("A1")
        board.cells("A2")
        board.cells("A3")
        board.cells("A4")
        board.cells("B1")
        board.cells("B2")
        board.cells("B3")
        board.cells("B4")
        board.cells("C1")
        board.cells("C2")
        board.cells("C3")
        board.cells("C4")
        board.cells("D1")
        board.cells("D2")
        board.cells("D3")
        board.cells("D4")

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

        board.place(cruiser, ["A1", "A2", "A3"])

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

        board.place(cruiser, ["A1", "A2", "A3"])

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


end