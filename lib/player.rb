class Player
	attr_accessor :name, :life_points
	def initialize(player_name)
		@name = player_name
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie."
	end

	def gets_damage(damage)
		@life_points -= damage
		if @life_points <= 0
			puts "#{@name} et mort !"
			@life_points = 0
		end
	end

	def rand_damage
		return rand(1..6)
	end

	def attack(player_threatened)
		puts "#{@name} attaque #{player_threatened.name}"
		damage = rand_damage
		puts  "#{@name} inflige #{damage} dégâts\n\n"
		player_threatened.gets_damage(damage)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level
	def initialize(player_name)
		@name = player_name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
	end

	def rand_damage
		return rand(1..6) * @weapon_level
	end

	def search_weapon
		new_level = rand(1..6)
			puts "Tu as trouvé une arme de niveau #{new_level}"
		if new_level > @weapon_level
			puts "Sapristi ! Cette arme est meilleure que ton arme actuelle (#{@weapon_level}), tu la récupère !"
			@weapon_level = new_level
		else
			puts "Elle n'est pas géniale, cette arme... Tu la laisse ici."
		end
	end

	def search_heal
		case rand(1..6)
		when 1
			puts "Tu n'as rien trouvé"
		when (2..5)
			puts "Tu as trouvé 50 points de vie."
			@life_points += 50
		when 6
			puts "Tu as trouvé 80 points de vie. Gros chanceux va"
			@life_points += 80
		end
		@life_points = 100 if @life_points > 100
		puts "Tu possède maintenant #{@life_points} points de vie."
	end
end