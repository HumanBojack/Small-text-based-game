require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

player1 = Player.new("Faruq")
player2 = Player.new("Azrode")

puts "Bienvenue dans le combat du siècle, opposant #{player1.name} à #{player2.name}, qui sera le grand vainqueur ?"
puts "#" * 30
puts "        ATTAQUE\n\n"

while player2.life_points > 0 && player1.life_points > 0
	player2.attack(player1)
	break if player1.life_points <= 0
	player1.attack(player2)
end