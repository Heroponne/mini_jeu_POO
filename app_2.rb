# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts ' --------------------------------------------------------------'
puts "| Bienvenue dans l'arène de 'ILS VEULENT TOUS MA POO' (x_x) !! |"
puts '|                                                              |'
puts "|    Le but du jeu est d'être le DERNIER survivant (^o^)//     |"
puts ' --------------------------------------------------------------'
sleep(3)
puts "Choisis ton nom, guerrier :\n \n"
print '> '
name_given = gets.chomp # definition du name du HumanPlayer

puts "Bienvenue, #{name_given} !! Et bon courage face à tes féroces adversaires...\n \n"
sleep(2)

user = HumanPlayer.new(name_given) # definition du HumanPlayer
player1 = Player.new('Josiane La Perfide') # definition du premier adversaire
player2 = Player.new('José El Conquistador') # definition du deuxieme adversaire

player1.show_state
sleep(2)
player2.show_state
sleep(2)
puts ' '

enemies_array = [player1, player2]

while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
  # le jeu dure tant que l'humain est vivant et qu'au moins un des 2 adversaires l'est aussi
  user.show_state
  sleep(2)
  puts "FIGHT !!\n \n"
  sleep(2)
  puts "Quelle action veux-tu effectuer ?\n \n"
  puts 'a - chercher une meilleure arme'
  puts "s - chercher à se soigner\n \n"
  puts 'attaquer un joueur en vue :'
  print '0 - '
  player1.show_state
  print '1 - '
  player2.show_state
  puts ' '
  print '> '
  choice = gets.chomp
  if choice != 'a' && choice != 's' && choice != '0' && choice != '1'
    # si le joueur ne rentre pas une bonne donnee, on lui relaisse une chance
    puts "C'est pas un choix, ça. Rééssaie encore une fois, et choisis mieux SINON...\n \n"
    print '> '
    choice = gets.chomp
  end
  if choice == 'a'
    user.search_weapon
    sleep(2)
  elsif choice == 's'
    user.search_health_pack
    sleep(2)
  elsif choice == '0'
    user.attacks(player1)
    sleep(2)
  elsif choice == '1'
    user.attacks(player2)
    sleep(2)
  else
    # si le joueur n'a pas rentre une bonne donnee une deuxieme fois
    puts "OK, PUNITION. Tu passes ton tour. Tes actes ont des CONSEQUENCES. Médite là-dessus. Et estime-toi heureux que je t'aie pas divisé ta vie par 2, petit effronté."
    sleep(3)
  end
  enemies_array.each do |enemy|
    # chaque adversaire attaque une fois le joueur
    if enemy.life_points.positive?
      enemy.attacks(user)
      sleep(2)
    end
    if enemy.life_points <= 0
      enemy.life_points = 0
      puts "#{enemy.name} ne fait rien depuis l'Au-Delà ! Quelle feignasse."
    end
  end
  puts "=========================\n \n"
end

if user.life_points.positive?
  # message de fin de partie
  puts 'BRAVO !! Mais à vaincre sans péril, on triomphe sans gloire. Tu sais, ça ? Alors calmos.'
else
  puts "Je ne pensais même pas que c'était possible de perdre (o_o) ! Ça mérite des félicitations de consolation !"
end
