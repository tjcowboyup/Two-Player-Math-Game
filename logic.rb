require "./player"

#generate random numbers between 1 & 20 for questions
def random_numbers
  @n1 = 1 + rand(20)
  @n2 = 1 + rand(20)
end

def random_operator
  operation = ['+', '-', '*', '/']
  index = rand(4)
  @operator = operation[index] 
end

def invalidGuessError
  begin
#  rescue NoMethodError => e
#    puts "You can't do that!"
    if @player_ans.is_a? !Integer
      raise InvalidGuessError, "Not an answer in integer"
    end
  rescue InvalidGuessError => e
    puts "You have to enter an integer for answer"
  end
end

def invalidname
  begin
    if Player.name == "" || nil
      raise InvalidNameError, "No name entered"
    end
  rescue InvalidNameError => e
    puts "You have to enter your name"
  end
end
