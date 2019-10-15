# frozen_string_literal: true

# definit la classe Player et ses methodes personnelles
class Player
  attr_accessor :name, :life_points
  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10

    def self.show_state
      # affiche l'etat d'un joueur
      puts "#{@name} a #{@life_points} points de vie"
    end

    def self.gets_damage(damage_received)
      # le Player recoit des degats
      @life_points -= damage_received
      # determine si le joueur est mort
      puts "le joueur #{@name} a été tué !" if @life_points <= 0
    end

    def self.attacks(other_player)
      # le Player inflige une certaine quantite de degats a un autre Player
      puts "#{@name} attaque #{other_player.name}"
      random_damage = compute_damage # nombre de degats mis dans une variable
      puts "il lui inflige #{random_damage} points de dommage"
      other_player.gets_damage(random_damage)
    end

    def compute_damage
      # determination du nombre de degats infliges
      rand(1..6)
    end
  end
end

# definit la classe enfant HumanPlayer et ses methodes particulieres
class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name_to_save)
    super(name_to_save) # invocation de la classe Player
    @weapon_level = 1 # ajout de la variable "niveau de l'arme"
    @life_points = 100 # modif du life_points pour attribuer une nouvelle valeur
    def self.show_state
      # modification de la methode show_state dans la classe HumanPlayer
      puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}"
    end
  end

  def compute_damage
    # definit un nouveau ratio de degats
    rand(1..6) * @weapon_level
  end

  def search_weapon
    # modifie la valeur de l'arme du joueur
    def new_weapon_level_value
      rand(1..6)
    end
    # definit le niveau de la nouvelle arme
    new_weapon_level = new_weapon_level_value
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      # determine si on garde l'arme trouvee (niveau est superieur a celle possedee)
      @weapon_level = new_weapon_level
      puts 'Wesh, elle est plus badass que ton arme actuelle, vas-y garde là et pimpe ta puissance !!'
    else # on ne garde pas l'arme trouvee
      puts "Oh. C'est pas ouf, cette arme. Garde pas ça, on ne se contente que du meilleur, quand on est un champion. CHAMPION."
    end
  end

  def search_health_pack
    def health_pack_value
      rand(1..6)
    end
    health_pack = health_pack_value # definit la valeur du pack de sante trouve
    if health_pack == 1 # pas de changement
      puts "Vous n'avez rien trouvé, ça sent le roussi :("
    elsif health_pack > 1 && health_pack < 6 # la vie augmente de 50 points
      @life_points += 50
      @life_points = 100 if @life_points > 100 # sans depasser 100
      puts 'Ah, ça fait du bien !! :) Tu regagnes 50 points de vie !!'
    else # la vie augmente de 80 points
      @life_points += 80
      @life_points = 100 if @life_points > 100 # sans depasser 100
      puts "OMG petit veinard, t'as trouvé un pack de 80 points de vie !! Ça refait une santé, ça."
    end
  end
end
