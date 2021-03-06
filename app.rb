# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
require "pry"

require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("Josiane")   #On créé une instance de Player appelée player1
player2 = Player.new("José")      #On créé une instance de Player appelée player2

puts "À ma droite #{player1.name}"  #Affichage du noms des combattants avec instance.name
puts "À ma gauche #{player2.name}"
puts player1.show_state              #On affiche l'état des combattants
puts ""
puts player2.show_state
puts "Passons à la phase d'attaque !"
puts "* Musique de suspense *"
player1.attacks(player2)          #Utilisation de la méthode attack par l'instance player 1 argument: player2
player2.attacks(player1)          #Utilisation de la méthode attack par l'instance player 2 argument: player1

while player1.life_points>0 && player2.life_points>0 do     #Boucle while pour générer des bagarres tant que aucun des deux n'est mort.
  player1.show_state
  player2.show_state
  puts "_____NEW ROUND_____"
  player1.attacks(player2)     #Nouvelle attaque.
    if player2.life_points <= 0     #Si life_points de player2 tombe à zero, alors il ne peut plus attaquer, puisqu'il est moooooort!
      break  #Alors on break pour sortir de la boucle while immédiatement. Sinon player2 attaque encore un coup alors qu'il vient de subir une trépanation mortelle!
  end
  player2.attacks(player1)
end



puts "Fin du game. Bisous."
