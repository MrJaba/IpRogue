require 'ruby-debug'
class Dungeon
  attr_accessor :map, :player
  
  def initialize(options={})
    map_file = options.fetch(:map_file,"level_1")
    @player = options.fetch(:player, Player.new)
    @map = read_map(map_file)
    @player.start_at(*player_start)
  end
  
  def render
    out = clear_screen
    @map.each_with_index{|row, index| out << render_row(row, index) }
    puts out
  end
  
private

  def read_map(map_file)
    map = []
    File.open(map_file).each_line do |line|
      map << line.chomp.split(//)
    end
    map
  end

  def player_start
    row = @map.find_index{|row| row.include? Tiles.start_symbol}
    [row,@map[row].index(Tiles.start_symbol)]
  end

  def clear_screen
    "\e[2J\e[f"
  end
  
  def render_row(row, row_index)
    to_draw = []
    row.each_with_index do |tile, column_index| 
      to_draw << if(player.position[1] == row_index && player.position[0] == column_index)
        Tiles.player
      else
        Tiles[tile] 
      end
    end
    to_draw.join("") +"\n"
  end
  
end