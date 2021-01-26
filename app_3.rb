require "bundler"
Bundler.require


require_relative "lib/player"
require_relative "lib/game"


puts "/-----------------------------------\\"
puts "|	Bienvenue dans mon jeu:     |"
puts "| 	  \"Balkany vs Police\"       |"
puts "\\-----------------------------------/"

print "Indiquez votre prénom >>> "
player_name = gets.chomp.capitalize
new_game = Game.new(player_name)
puts "Bienvenue, #{player_name} Balkany"

while new_game.is_still_going?
	puts "-" * 50
	new_game.menu
	puts "_" * 50
	print ">>> "
	new_game.menu_choice(gets.chomp)
	new_game.enemies.each{|i| new_game.kill_bot(i.name) if i.life_points <= 0}
	new_game.enemies_attack
	gets
end
new_game.end
