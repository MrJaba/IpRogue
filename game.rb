require './tiles'
require './player'
require './dungeon'

class Game
  attr_accessor :dungeon, :player, :dungeons
  
  def initialize
    @player = Player.new
    @dungeons = Array(1..4)
    next_dungeon
  end

  def run
    begin
      @dungeon.render 
      update
      sleep(0.5)
    end until finished?
    puts "FIN!"
  end
  
private

  def next_dungeon
    @dungeon = Dungeon.new(player:@player, map_file:"level_#{dungeons.shift}")
  end

  def finished?
    dungeons.empty? && dungeon.complete?
  end
  
  def update
    player.move
  end
  
end

#Game.new.run