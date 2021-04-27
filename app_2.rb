require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#-----------------------Fin require

#-----------------------Début code

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts

puts "Bienvenue, quel est ton nom de joueur ?"
print "> "
user_name = gets.chomp
puts "Bienvenue, #{user_name}, j'espère que tu es prêt à affronter nos deux terribles robots !"
  
user=HumanPlayer.new(user_name)
player1=Player.new("Josiane")
player2=Player.new("José")
enemies = [player1, player2]


while user.life_points > 0 && (player1.life_points >0 || player2.life_points >0)
  
  puts
  puts "********"
  puts user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner" 
  puts
  puts "Attaquer un joueur en vue:"
 
    enemies.each do |player|
      if player.life_points >0
        print "#{enemies.find_index(player)} - "
        puts player.show_state
      end
    end
  puts  

  print "> "
  user_choice= gets.chomp
    if user_choice == "a"
      puts user.search_weapon
    elsif user_choice =="s"
      puts user.search_health_pack
    else
      puts user.attacks(enemies[user_choice.to_i])
    end

  puts "Les autres joueurs ripostent !"  
  enemies.each do |player|
    if player.life_points >0
      player.attacks(user)
      puts "#{user.name} n'a plus que #{user.life_points} points de vie!"
    end
  end
end

puts "La partie est finie"
if user.life_points>0
  puts "BRAVO ! TU AS GAGNE !" 
else 
  puts "Loser! Tu as perdu."
end

binding.pry