class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @hit = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def fire_upon
    if (!self.empty? && !self.fired_upon?)
      @ship.hit
    end
    @hit = true
  end

  def fired_upon?
    @hit
  end

  def render(show = nil)
    if !self.fired_upon?
      if show && !self.empty?
        return "S"
      end

      return "."

    elsif self.fired_upon? && self.empty?
      return "M"

    elsif self.fired_upon? && @ship.sunk?
      return "X"

    else
      return "H"
    end
  end


end
