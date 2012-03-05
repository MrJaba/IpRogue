require 'colored'

module Tiles
  extend self
  
  @tiles ={
    '#' => "#".green,
    ' ' => ' ',
    '>' => '>'.blue,
    '<' => '<'.magenta,
    '@' => '@'.red, 
    '*' => '*'.yellow,
    '+' => '+'.cyan,
    '&' => '&'.white}
  
  def [](tile)
    @tiles[tile]
  end
  
  def player
    Tiles['@']
  end
  
  def start_symbol
    "<"
  end
  
  def down_stairs_symbol
    ">"
  end
  
  def goal_symbol
    "&"
  end
end