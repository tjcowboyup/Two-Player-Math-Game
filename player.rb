LIFE = 3

class Player
  attr_accessor :name, :life, :score
  def initialize(name)
    self.name = name
    self.life = LIFE
    self.score = 0
  end
end
