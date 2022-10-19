require './lib/board'

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



end