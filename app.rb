# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')

puts "Voici l'état de chaque joueur :" # debute le jeu
player1.show_state
player2.show_state
puts '=-=-=-=-=-=-=-=-=-=-=-=-=-='
sleep(2)

while player1.life_points.positive? && player2.life_points.positive?
  # le jeu se poursuit tant que les 2 joueurs ont de la vie
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
  puts '=-=-=-=-=-=-=-=-=-=-=-=-=-='
  sleep(2)
  puts "Voici l'état de nos joueurs :"
  player1.show_state
  player2.show_state
  puts '=-=-=-=-=-=-=-=-=-=-=-=-=-='
  sleep(2)
end
