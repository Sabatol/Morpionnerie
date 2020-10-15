class Player

  attr_accessor :name, :value, :points
  # Initialise un joueur avec un nom et un symbole.
  def initialize(name, value)
    @name = name
    @value = value
    @points = 0
  end

  def show_state
    puts "#{name} jouera avec les #{@value.black.on_white}, il a actuellement #{@points} points."
  end
end