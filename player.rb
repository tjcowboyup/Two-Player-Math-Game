LIFE = 3

class InvalidNameError < StandardError
end

class Player
  attr_accessor :name, :life, :score
  def initialize(name)
    self.name = name
    self.life = LIFE
    self.score = 0
  end

  def valid?
    !(name == "" || nil)
  end

  def raise_error_if_invalid
    raise InvalidNameError if !valid?
  end

end
