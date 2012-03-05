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
end