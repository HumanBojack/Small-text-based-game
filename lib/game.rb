class Game
	attr_accessor :hp, :enemies

	def initialize(name)
		@enemies = []
		["Faruq", "Azrode", "Day", "Caro"].each {|player| @enemies << Player.new(player)}
		@hp = HumanPlayer.new(name)
	end

	def kill_bot(bot_name)
		@enemies.delete(@enemies.find{|each_name| each_name.name == bot_name })
	end

	def is_still_going?
		@hp.life_points > 0 && @enemies.any?{|i| i.life_points > 0}
	end

	def show_players
		case @hp.life_points
		when (1..33)
			puts "Tu n'as plus beaucoup de vie. (#{@hp.life_points}PV)"
		when (34..66)
			puts "Tu semble avoir un niveau correct de points de vie (#{@hp.life_points}PV)"
		when (67..100)
			puts "Tu a un niveau de point de vie excellent. (#{@hp.life_points}PV)"
		end
		puts "Il reste #{@enemies.length} ennemis."
	end

	def menu
		puts "Tu dispose de #{hp.life_points} points de vie."
		puts "Que cherche tu à faire ?\n\n"
		puts "1 - Chercher une meilleure arme"
		puts "2 - Chercher des soins\n\n"
		puts "Attaquer un autre joueur :"
		@enemies.each_with_index do |e, i|
			puts "#{i + 3} - Attaquer #{e.name} (#{e.life_points}PV)" if e.life_points > 0
		end
	end

	def menu_choice(choice)
		case choice.to_i
			when 1
				@hp.search_weapon
			when 2
				@hp.search_heal
			when (3..6)
				@hp.attack(@enemies[choice.to_i - 3])
			else
				"Veuillez taper une action réalisable"
		end
	end

	def enemies_attack
		@enemies.each{|i| i.attack(@hp)}
	end

	def end
		if @hp.life_points <= 0
			puts "Vous êtes mort de décès."
		elsif @enemies.length == 0
			puts "!!!!!!!!! Bravo vous êtes le plus fort !!!!!!!!!"
			10.times do |i|
				puts "!!!!!!!!!" * 10
			end
		end
	end

end