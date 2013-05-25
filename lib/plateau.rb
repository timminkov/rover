class Plateau
  def initialize(boundx, boundy)
    @boundx = boundx
    @boundy = boundy
  end

  def is_a_valid_move?(x, y)
    return false if less_than_zero?(x, y)
    return false if greater_than_bounds?(x, y)
    return true
  end

  private
  
  def less_than_zero?(x, y)
    x < 0 || y < 0
  end 

  def greater_than_bounds?(x, y)
    x > @boundx || y > @boundy
  end
end
