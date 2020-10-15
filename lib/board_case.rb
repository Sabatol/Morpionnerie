
class BoardCase
  attr_accessor :value, :id

  #Initialise une case avec un nom. Lui attribue une valeur par défaut.
  def initialize(name)
    @value = "   "
    @id = name
  end

end
