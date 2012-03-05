class Player
  attr_accessor :x, :y, :surroundings
  
  # Implement this method to move around the dungeon
  # You can move 1 square in any direction on each call of this method
  # call surroundings.view to see whats arround you and base your decisions on that information
  def move
    surroundings.view
    @x += 1
    @y += 1
  end
  
  def start_at(x,y)
    @x = x
    @y = y
  end
  
  def position
    [x,y]
  end
end