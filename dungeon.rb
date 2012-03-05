class Dungeon
  attr_accessor :map, :player
  
  def initialize(options={})
    map_file = options.fetch(:map_file,"level_1")
    @player = options.fetch(:player, Player.new)
    @map = read_map(map_file)
    @player.start_at(*player_start_position)
  end
  
  def render
    out = clear_screen
    @map.each_with_index{|row, index| out << render_row(row, index) }
    puts out
  end
  
  def complete?
    @player.position == goal_position
  end
  
private

  def read_map(map_file)
    map = []
    File.open(map_file).each_line do |line|
      map << line.chomp.split(//)
    end
    map
  end

  def player_start_position
    find_tile(Tiles.start_symbol)
  end
  
  def goal_position
    find_tile(Tiles.down_stairs_symbol) || find_tile(Tiles.goal_symbol)
  end
  
  def find_tile(tile)
    row = @map.find_index{|row| row.include? tile}
    column = row && @map[row].index(tile)
    row && column && [column, row]
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