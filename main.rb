require "./logic"
require "./player"

@turn = 1

class InvalidGuessError < StandardError
end
class InvalidGuessError < StandardError
end

def setup

  p "You are Player #{@turn}. What is your name?"
  name = gets.chomp
  @player1 = Player.new(name)
  @player1.raise_error_if_invalid
  @turn += 1
  p "You are Player #{@turn}. What is your name?"
  name = gets.chomp
  @player2 = Player.new(name)  
  @player2.raise_error_if_invalid
  @turn -= 1

end

def generate_question

  random_numbers
  random_operator
  p "What is #{@n1} #{@operator} #{@n2}"
  @player_ans =gets.chomp
  invalid_Guess_Error
  @player_ans = @player_ans.to_i

end

def invalid_Guess_Error

  begin
    if @player_ans == "" || !(@player_ans.is_a? Integer)
      raise InvalidGuessError, "Not an answer in integer"
    end
  rescue InvalidGuessError => e
    puts "You have to enter an integer for answer"
    @player_ans =gets.chomp
  end
  
end

def prompt_player_for_answer

  puts "It's  Player #{@turn}'s turn:"

end

def verify_answer

  @correct_ans = @n1.send @operator, @n2
  if @correct_ans == @player_ans
   @player_answer = true
  else          
   @player_answer = false
  end

end

def scores_P1

  @turn += 1 
  if verify_answer
    @player1.score += 1
  else
    @player1.life -= 1
  end

end

def scores_P2

  @turn -= 1
  if verify_answer
    @player2.score += 1
  else
    @player2.life -= 1
  end

end

def scoreboard

    puts "P1 score: #{@player1.score} | P2 score: #{@player2.score}"
    puts "P1 life: #{@player1.life} | P2 life: #{@player2.life}"
    puts "\n"

end

def repeat

  p "Do you want to keep playing?[yes/no] "
  @answer = gets.chomp.downcase
  if @answer == "yes"
    setup
    game
    repeat
  else
    scoreboard
    return
  end

end

def change_turn
  @turn += 1
end

def game
  
  while @player1.life > 0 && @player2.life > 0 do
    prompt_player_for_answer
    generate_question
    verify_answer
    scores_P1
    prompt_player_for_answer
    generate_question
    verify_answer
    scores_P2
    scoreboard
  end
  puts "Game over"
  
end

setup
game
repeat
