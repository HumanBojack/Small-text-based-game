require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

# player1 = Player.new("Faruq")
# player2 = Player.new("Azrode")
# rom = HumanPlayer.new("Rom1")

puts "/-----------------------------------\\"
puts "|	Bienvenue dans mon jeu:     |"
puts "| 	  \"Balkany vs Police\"       |"
puts "\\-----------------------------------/"

print "Indiquez votre prénom >>> "
player_name = gets.chomp.capitalize
hp = HumanPlayer.new(player_name)
puts "Bienvenue, #{hp.name} Balkany"

players = []
["Faruq", "Azrode"].each {|player| players << Player.new(player)}


while hp.life_points > 0 && players.any?{|i| i.life_points > 0}
	puts "Tu dispose de #{hp.life_points} points de vie."
	puts "Que cherche tu à faire ?\n\n"
	puts "b - Chercher une meilleure arme"
	puts "n - Chercher des soins\n\n"
	puts "Attaquer un autre joueur :"
	puts "0 - Attaquer #{players[0].name} (#{players[0].life_points}PV)"
	puts "1 - Attaquer #{players[1].name} (#{players[1].life_points}PV)"
	choice = gets.chomp
	case choice
	when "b"
		hp.search_weapon
	when "n"
		hp.search_heal
	when "0"
		hp.attack(players[0])
	when "1"
		hp.attack(players[1])
	else
		"Veuillez taper une action réalisable"
	end


	puts "Riposte de l'ennemi !"
	players.each{|i| i.attack(hp)}
end

puts "Fin"