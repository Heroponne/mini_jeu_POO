class Player

  attr_accessor :name, :life_points

  def initialize(name_to_save)

  	@name = name_to_save
  	@life_points = 10

  	def self.show_state # affiche l'état d'un joueur
  	  puts "#{@name} a #{@life_points} points de vie"
  	end

  	def self.gets_damage(damage_received) # le Player reçoit des dégâts
  	  @life_points = @life_points - damage_received
  	  if @life_points <= 0 # détermine si le joueur est mort
  	  	puts "le joueur #{@name} a été tué !"
  	  end
  	end

  	def self.attacks(other_player) # le Player inflige une certaine quantité de dégâts à un autre Player
      puts "#{@name} attaque #{other_player.name}"
      random_damage = compute_damage # nombre de dégâts mis dans une variable
      puts "il lui inflige #{random_damage} points de dommage" 
      other_player.gets_damage(random_damage) 
  	end

  	def compute_damage # détermination du nombre de dégâts infligés
      return rand(1..6)
    end
  end
end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name_to_save)
  	super(name_to_save) # invocation de la classe Player
  	@weapon_level = 1 # ajout de la variable "niveau de l'arme"
  	@life_points = 100 # modification du life_points pour en attribuer une nouvelle valeur
    
    def self.show_state # modification de la méthode show_state dans la classe HumanPlayer
      puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}"
    end
  end

  def compute_damage # définit un nouveau ratio de dégâts
    rand(1..6) * @weapon_level    	
  end
  
  def search_weapon 
  	def new_weapon_level_value
  	  rand(1..6) 
  	end
  	new_weapon_level = new_weapon_level_value # définit le niveau de la nouvelle arme trouvée
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level # détermine si on garde l'arme trouvée (son niveau est supérieur à celle possédée)
      @weapon_level = new_weapon_level
      puts "Wesh, elle est plus badass que ton arme actuelle, vas-y garde là et pimpe ta puissance !!"
    else # on ne garde pas l'arme trouvée
      puts "Oh. C'est pas ouf, cette arme. Garde pas ça, on ne se contente que du meilleur, quand on est un champion. CHAMPION."
    end
  end

  def search_health_pack
  	def health_pack_value
  	  rand(1..6)
  	end
  	health_pack = health_pack_value # définit la valeur du pack de santé trouvé
  	if health_pack == 1 # pas de changement
  	  puts "Vous n'avez rien trouvé, ça sent le roussi :("
  	elsif health_pack > 1 && health_pack < 6 # la vie augmente de 50 points
  	  @life_points = @life_points + 50
  	  if @life_points > 100 # sans dépasser 100
  	    @life_points = 100
  	  end
  	  puts "Ah, ça fait du bien !! :) Tu regagnes 50 points de vie !!"
  	else # la vie augmente de 80 points
  	  @life_points = @life_points + 80
  	  if @life_points > 100 # sans dépasser 100
  	    @life_points = 100
  	  end
  	  puts "OMG petit veinard, t'as trouvé un pack de 80 points de vie !! Ça refait une santé, ça."
  	end  	
  end
end
