require "./logic"
require "./player"

P1 = Player.new
#P1.P1_life = 3
#P1.P1_score = 0
P2 = Player.new
#P2.P2_life = 3
#P2.P2_score = 0
def generate_question
  while (@P1_life > 0 || @P2_life > 0)
    puts "It's Player #{@turn}'s turn:"
    prompt_player_for_answer
    verify_answer
    scores_P1
    puts "It's Player #{@turn}'s turn:"
    prompt_player_for_answer
    verify_answer
    scores_P2
  end
end

def prompt_player_for_answer
  random_numbers
  p "What is #{@n1} + #{@n2}"
  @player_ans =gets.chomp.to_i
end

def verify_answer
  @correct_ans = @n1 + @n2
  if @correct_ans == @player_ans
    @player_answer = true
  else          
    @player_answer = false
  end
end

def scores_P1
  @turn += 1 
  if verify_answer
    @P1_score += 1
    p "P1 score: #{@P1_score} P2 score: #{@P2_score}"
    p "P1 life: #{@P1_life} P2 score: #{@P2_life}"
  else
    @P1_life -= 1
    p "P1 score: #{@P1_score} P2 score: #{@P2_score}"
    p "P1 life: #{@P1_life} P2 score: #{@P2_life}"
  end
end

def scores_P2
  @turn -= 1
  if verify_answer
    @P2_score += 1
    p "P1 score: #{@P1_score} P2 score: #{@P2_score}"      
    p "P1 life: #{@P1_life} P2 score: #{@P2_life}"
  else
    @P2_life -= 1
    p "P1 score: #{@P1_score} P2 score: #{@P2_score}"    
    p "P1 life: #{@P1_life} P2 score: #{@P2_life}"  
  end
end

generate_question
