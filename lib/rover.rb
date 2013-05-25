class Rover
  COMPASS = ['N', 'E', 'S', 'W'] 

  def initialize(x, y, nav)
    @x = x
    @y = y
    @nav = nav 
  end

  def location
    [@x, @y, @nav]
  end

  def receive_instruction!(instruction)
    move if instruction == 'M'
    turn_left if instruction == 'L'
    turn_right if instruction == 'R'
  end

  private

  def move
    @y += 1 if @nav == 'N'
    @y -= 1 if @nav == 'S'
    @x += 1 if @nav == 'E'
    @x -= 1 if @nav == 'W'
  end    

  def turn_left
    @nav = COMPASS[COMPASS.index(@nav) - 1]
  end

  def turn_right
    @nav = COMPASS[COMPASS.index(@nav) + 1] || COMPASS[0]
  end
end
