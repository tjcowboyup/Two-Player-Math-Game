@P1_life = @P2_life = 3
@P1_score = @P2_score = 0
@player_answer = true
@turn = 1

class Player
  attr_accessor :P1_life, :P2_life , :P1_score, :P2_score
  def life
  @P1_life = P1_life
  @P2_life = P2_life
  end
  def score
    @P1_score = P1_score
    @P2_score = P2_score
  end
end
