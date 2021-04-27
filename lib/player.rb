require 'pry'

class Player
  attr_accessor :name, :life_points
  @@all_ennemies = []

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
    @@all_ennemies << self
  end

  def show_state
    if life_points > 0
      puts "#{name} a #{life_points} points de vie"
    elsif life_points <= 0
      puts "#{name} est maintenant mort et enterré !"
    end
  end

  def attacks(player_attacked)
    print "#{name} attaque le joueur #{player_attacked.name}"
    y = compute_damage
    puts " et lui inflige #{y} dégâts !"
    player_attacked.gets_damage(y)
  end

  def compute_damage
    return rand(1..6)
  end

  def gets_damage(x)
    @life_points = @life_points - x
    if life_points <= 0
      puts "Le joueur #{name} a été tué !"
    end
  end

end

class HumanPlayer < Player
  attr_accessor :name, :life_points, :weapon_level, :new_weapon

  def initialize(name_to_save)
    @weapon_level = 1

    super(name_to_save)
    @life_points = 100
  end

  def show_state
    if life_points > 0
      puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
    elsif life_points <= 0
      puts "#{name} a 0 point de vie et une arme de niveau #{weapon_level}."
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand (1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif health_pack == 6 && @life_points <20
      puts  "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
    elsif health_pack == 6 && @life_points >19
      puts  "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = 100
    elsif life_points <50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = 100
    end
  end

end

#binding.pry