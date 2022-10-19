require './lib/ship'
require './lib/cell'

class Board

  attr_reader :cells

  def initialize()
    @cells =
    {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }

  end


  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end


  def valid_placement?(ship, cells)

    letters = cells.map do |cell|
      cell.coordinate[0]
    end
    nums = cells.map do |cell|
      cell.coordinate[1]
    end

    if (ship.length != cells.count)
      return false
    end

    cells.each do |cell|
      if !self.valid_coordinate?(cell.coordinate) || !cell.empty?
        return false
      end
    end

    if letters.uniq.count == 1
      if ("1".."4").each_cons(cells.count).include?(nums)
        return true
      end
    end

    if nums.uniq.count == 1
      if ("A".."B").each_cons(cells.count).include?(letters)
        return true
      end
    end
    false
  end


  def place(ship, cells)
    if self.valid_placement?(ship, cells)
      cells.each do |cell|
        cell.place_ship(ship)
      end
    end
  end

  def render
    board_string =
    "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"
  end

end
