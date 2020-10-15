
class Board

  attr_accessor :array_board_case

  #Initialise neufs cellules et les balance dans un array
  def initialize
    @A0 = BoardCase.new("a0")
    @A1 = BoardCase.new("a1")
    @A2 = BoardCase.new("a2")
    @A3 = BoardCase.new("a3")
    @B1 = BoardCase.new("b1")
    @B2 = BoardCase.new("b2")
    @B3 = BoardCase.new("b3")
    @C1 = BoardCase.new("c1")
    @C2 = BoardCase.new("c2")
    @C3 = BoardCase.new("c3")
    @array_board_case = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
  end

  #Propose au joueur de choisir son emplacement de jeu et le piège tant qu'il ne rentre pas un chiffre 
  def menu_choice
    puts "C'est au tour de #{$current_player.name}. Où veux tu jouer ? "
    choice = gets.chomp
    numbers = ["1","2","3","4","5","6","7","8","9"]
    until numbers.include?(choice) && @array_board_case[choice.to_i - 1].value == @A0.value do
      puts "Ahah, recommence !"
      choice = gets.chomp
    end
    @array_board_case[choice.to_i - 1].value = $current_player.value
  end

  # Renvoie true si une combinaison gagnante est détectée, sinon nil si toutes les cases sont remplies, sinon false (la partie doit continuer)
  def is_victory?
        if (@A1.value == @A2.value && @A1.value == @A3.value && @A1.value != @A0.value) ||
          (@B1.value == @B2.value && @B1.value == @B3.value && @B1.value != @A0.value) || 
          (@C1.value == @C2.value && @C1.value == @C3.value && @C1.value != @A0.value) || 
          (@A1.value == @B2.value && @A1.value == @C3.value && @A1.value != @A0.value) || 
          (@A3.value == @B2.value && @A3.value == @C1.value && @A3.value != @A0.value) || 
          (@A1.value == @B1.value && @A1.value == @C1.value && @C1.value != @A0.value) || 
          (@A2.value == @B2.value && @A2.value == @C2.value && @C2.value != @A0.value) || 
          (@A3.value == @B3.value && @A3.value == @C3.value && @C3.value != @A0.value)
          return true
        elsif @A1.value != @A0.value && @A2.value != @A0.value && @A3.value != @A0.value && @B1.value != @A0.value && @B2.value != @A0.value && @B3.value != @A0.value && @C1.value != @A0.value && @C2.value != @A0.value && @C3.value != @A0.value
          return nil
        else
          return false
        end
  end

  # Fait apparaitre le plateau de jeu !
  def show
    puts ""
    puts " #{@array_board_case[0].value} | #{@array_board_case[1].value} | #{@array_board_case[2].value}   ||   1 | 2 | 3 "
    puts "  -------------       ------------- "
    puts " #{@array_board_case[3].value} | #{@array_board_case[4].value} | #{@array_board_case[5].value}   ||   4 | 5 | 6 "
    puts "  -------------       ------------- "
    puts " #{@array_board_case[6].value} | #{@array_board_case[7].value} | #{@array_board_case[8].value}   ||   7 | 8 | 9 "
    puts""
  end
end
