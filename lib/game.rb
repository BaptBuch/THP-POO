require 'pry'
require_relative 'player'

class Game
  attr_accessor :human_player, :ennemies
  player1=Player.new("Josiane")
  player2=Player.new("Gertrude")
  player3=Player.new("Ginette")
  player4=Player.new("Bernadette")
  @enemies = [player1, player2, player3, player4]
  print @enemies

  def initialize(player_name_to_save)
    @human_player=HumanPlayer.new(player_name_to_save)
  end

  def welcome_screen

  def kill_player(player)
    if player.life_points < 1
      @enemies.delete(player)
    end
  end

  def is_still_ongoing?
    return @human_player.life_points > 0 && @enemies.length > 0
  end

  def show_players
    puts @human_player.show_state
    print "Il reste #{@enemies.length} à combattre"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher à se soigner" 
    puts
    puts "Attaquer un joueur en vue:"
   
      @enemies.each do |player|
        if player.life_points >0
          print "#{@enemies.find_index(player)} - "
          puts player.show_state
        end
      end
    puts
  end 

  def menu_choice(string)
    if user_choice == "a"
      puts @human_player.search_weapon
    elsif user_choice =="s"
      puts @human_player.search_health_pack
    else
      puts @human_player.attacks(player(user_choice.to_i+1))
      puts (player(user_choice.to_i+1)).show_state
    end
  end

  def ennemies_attack
    @enemies.each do |player|
      if player.life_points >0
        player.attacks(user)
        puts "#{user.name} n'a plus que #{user.life_points} points de vie!"
      end
    end
  end

  def end
    puts "La partie est finie"
    if user.life_points>0
      puts "BRAVO ! TU AS GAGNE !" 
    else 
      puts "Loser! Tu as perdu."
    end
  end

end

binding.pry