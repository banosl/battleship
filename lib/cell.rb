class Cell

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def fire_upon
    @ship.hit
  end
end
