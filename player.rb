class Player
  attr_accessor :x, :y
  
  #Implement this method
  def move
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