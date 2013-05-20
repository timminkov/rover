class Rover
  def initialize(x, y, h)
    @x = x
    @y = y
    @h = h
  end

  def location
    [@x, @y, @h]
  end

  def turn_left
    case @h
      when 'N'
        @h = 'W'
      when 'W'
        @h = 'S'
      when 'S'
        @h = 'E'
      else
        @h = 'N'
    end 
  end

  def turn_right
    case @h
      when 'N'
        @h = 'E'
      when 'E'
        @h = 'S'
      when 'S'
        @h = 'W'
      else
        @h = 'N'
    end
  end

  def move
    case @h
      when 'N'
        @y += 1
      when 'E'
        @x += 1
      when 'S'
        @y -= 1
      else
        @x -= 1
    end
  end
end
