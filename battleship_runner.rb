require './lib/board'
require './lib/cell'
require './lib/computer'
require './lib/game'
require './lib/player'
require './lib/ship'


player = Player.new

puts player.welcome
require 'pry'; binding.pry
player.place_ships
# game.start