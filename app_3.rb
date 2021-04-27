require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts

puts "Bienvenue, quel est ton nom de joueur ?"
print "> "
user_name = gets.chomp
puts "Bienvenue, #{user_name}, j'espère que tu es prêt à affronter nos terribles robots !"
new_game=Game.new(user_name)

while new_game.is_still_ongoing?
  new_game.show_players
  new_game.menu
  print "> "
  user_choice = gets.chomp
  new_game.menu_choice(user_choice)
  new_game.ennemies_attack
end

new_game.end
