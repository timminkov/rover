class Rover
  def initialize(x, y, nav)
    @x = x
    @y = y
    @nav = nav 
    @compass = ['N', 'E', 'S', 'W'] 
  end

  def location
    [@x, @y, @nav]
  end

  def move
    @y += 1 if @nav == 'N'
    @y -= 1 if @nav == 'S'
    @x += 1 if @nav == 'E'
    @x -= 1 if @nav == 'W'
  end    

  def turn_left
    @nav = @compass[@compass.index(@nav) - 1]
  end

  def turn_right
    @nav = @compass[@compass.index(@nav) + 1] || @compass[0]
  end
end
