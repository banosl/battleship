require 'RSpec'
require './lib/cell'

RSpec.describe Cell do


  describe '#initialize' do
    it 'exists and is correctly initialized' do
      cell = Cell.new("B4")

      expect(cell).to be_instance_of(Cell)
      expect(cell.coordinate).to eq("B4")
      expect(cell.empty?).to eq(true)
      expect(cell.fired_upon?).to eq(false)
    end
  end

  describe '#place_ship' do
    it 'corrrectly assigns the ship instance variable to the object passed in' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.empty?).to eq(false)
      expect(cell.ship).to eq(ship)
    end
  end

  describe '#fire_upon' do
    it 'damages ship and adjusts hit variable' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end

  describe '#render' do
    it 'correctly renders every case' do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)

      cell_2 = Cell.new("A2")

      cell_3 = Cell.new("C3")
      sub = ship.new("Submarine", 2)
      cell_3.place_ship(sub)
      cell_3.fire_upon
      cell_3.fire_upon

      cell_4 = Cell.new("D1")
      carrier = ship.new("Aircraft Carrier", 4)
      cell_4.place_ship(carrier)
      cell_4.fire_upon

      cell_5 = Cell.new("F4")
      cell_5.fire_upon

      expect(cell_1.render(true)).to eq("S")
      expect(cell_2.render).to eq(".")
      expect(cell_3.render).to eq("X")
      expect(cell_4.render).to eq("H")
      expect(cell_5.render).to eq("M")
    end
  end



end
