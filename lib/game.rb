require 'pry'
require_relative 'player'

class Game
  attr_accessor :human_player, :enemies
  
  print @enemies

  def initialize(player_name_to_save)
    @human_player=HumanPlayer.new(player_name_to_save)
    @enemies = []
    player1=Player.new("Josiane")
    @enemies << player1
    player2=Player.new("Gertrude")
    @enemies << player2
    player3=Player.new("Ginette")
    @enemies << player3
    player4=Player.new("Bernadette")
    @enemies << player4 
  end

  def kill_player
    @enemies.each do |player|
      if player.life_points < 1
        @enemies.delete(player)
      end
      return @enemies.length
    end
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.length > 0
      return true
    end
  end

  def show_players
    print @human_player.show_state
    puts "Il reste #{@enemies.length} ennemis à combattre"
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
          print "#{@enemies.index(player)} - "
          puts player.show_state
        end
      end
    puts
  end 

  def menu_choice(user_choice)
    if user_choice == "a"
      puts @human_player.search_weapon
    elsif user_choice =="s"
      puts @human_player.search_health_pack
    else
      puts @human_player.attacks(@enemies[user_choice.to_i])
      kill_player
    end
  end

  def ennemies_attack
    @enemies.each do |player|
      if player.life_points >0
        player.attacks(@human_player)
        puts "#{@human_player.name} n'a plus que #{@human_player.life_points} points de vie!"
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

#binding.pry