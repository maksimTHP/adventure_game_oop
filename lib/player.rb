class Player

  attr_accessor :name, :life_points

  def initialize(name) #Ici on décalre notre initialize. C'est cette def qui va servir pour créer notre Player.new on a besoin d'une entrée (le nom du joueur) pour créer une instance qui contiendra le nom et le nombre de point de vie.
    @name = name
    @life_points = life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie" #Affche "Nom de l'instance" a "Point de vie de l'instance" points de vie
  end

  def gets_damage(damage)   #On applique les dommages générés. Point de vie = Point de vie - les dégats
    @life_points = @life_points - damage
    if @life_points > 0  #Ici on affiche directement si un des joueurs est mort avec une focntion conditionnelle. Soit il est pas mort et il lui reste des points de vie (then) soit il est mort et on le dit (else)
      then puts "#{@name} a #{@life_points} points de vie !"
      else puts "#{@name} n'a plus de point de vie, #{@name} es muerto ! "
    end
  end

  def attacks(is_attacked)  #Fonction d'attaque instance.attacks signigie qu'une instance va utiliser cette fonction pour attaquer. Entre parenthèse l'arguement est l'autre joueur forcément. player1.attacks(player2)
    puts "#{@name} attaque #{is_attacked.name}"
    current_attack = compute_damage #on lance le dès pour savoir combien de dégat il va prendre et on stocke les dégats dans une variable appelée current_attack
    puts "Il lui inflige #{current_attack} points de dégat."
    is_attacked.gets_damage(current_attack) #On utilise la fonction gets_damage en instance on met is_attacked (le player qui sera argument de la fonction attacks) et on lui inflige les dégats stockés dans current_attack
  end

  def compute_damage  #Roll the dice
    return rand(1..6)
  end
end
