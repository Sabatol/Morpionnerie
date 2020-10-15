require 'welcomepage'

class Game

  attr_accessor :current_player, :status, :board, :array_players

  # Présentation du jeu, initialise 2 joueurs et un board. Créer un array pour les deux joueurs et une variable token pour jouer.
  def initialize
    welcome = Welcome.new
    puts "Salut et bienvenue dans notre super jeu de morpion !"
    sleep (1.50)
    puts "Le morpion nécessite 2 joueurs"
    sleep (1.50)
    puts "Voyons voir, quel est le nom du premier joueur ?"
    print "> "
    p1_name = gets.chomp
    @player_1 = Player.new("#{p1_name}", " X ".blue.on_white)
    sleep (1.00)
    puts "OK merci, quel est le nom du deuxième joueur ?"
    print "> "
    p2_name = gets.chomp
    @player_2 = Player.new("#{p2_name}", " O ".red.on_white)
    sleep (1.00)
    puts "Ça roule, merci beaucoup ! Nous allons maintenant initialiser une nouvelle partie !"
    sleep (2.50)
    @player_1.show_state
    @player_2.show_state
    sleep (2.50)
    puts "Que le jeu commence !!!"
    @board = Board.new
    @array_players = [@player_1, @player_2]
    $current_player = @array_players[0]
    $token = 1
  end

  # Tour de jeu : le plateau est montré et le joueur choisit une case.
  def turn
    @board.show
    @board.menu_choice
  end

  # Vérifie si le token pour jouer est présent.
  def check_token
    if $token == 1
      true
    else
      false
    end
  end

  # Propose au joueur une nouvelle partie. Si il ne veut pas, le token est supprimé.
  def new_round
    puts "Top ! Souhaitez-vous faire une nouvelle partie ? (Répondez oui ou non, merci)"
    print "> "
    rep = gets.chomp
    until rep == "oui" || rep == "non, merci" 
      puts "On t'avait dit de dire 'oui' ou 'non, merci' !"
      rep = gets.chomp
    end
    if rep == "oui"
      @board = Board.new
      $token = 1
    else
      sleep(2.00)
      puts
      puts "Voila."
      sleep (1.00)
      puts "Allez... ok." 
      sleep (1.00)
      puts "A tantôt !"
      sleep(1.00)
      $token = 0
      puts
    end

  end

  # Détecte si le jeu doit s'arrêter ou non.
  def is_the_game_stop?
    if board.is_victory? == false
      return false
    elsif board.is_victory? == nil
      return true
    else
      return true
    end
  end

  # Annonce la fin du jeu
  def end
    board.show
    if board.is_victory? == true
      puts "#{$current_player.name} a gagné, IN-CRO-YA-BLE !"
      $current_player.points += 1
      $current_player.show_state
      sleep (1.35)
      require 'bananagif'
    else
      puts "Match nul... C'est bien normal à ce jeu !"
    end
  end

  # Change de tour, à l'autre joueur de jouer !
  def switch_turn
    case $current_player
      when @player_1
        $current_player = @player_2
      when @player_2
        $current_player = @player_1
    end
  end

end
