OPTIONS = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]

RULES = [
  {
    choice: ["Rock"],
    beats: ["Scissors", "Lizard"],
    loses: ["Paper", "Spock"]
  },
  {
    choice: ["Paper"],
    beats: ["Rock", "Spock"],
    loses: ["Scissors", "Lizard"]
  },
  {
    choice: ["Scissors"],
    beats: ["Paper", "Lizard"],
    loses: ["Rock", "Spock"]
  },
  {
    choice: ["Lizard"],
    beats: ["Paper", "Spock"],
    loses: ["Rock", "Scissors"]
  },
  {
    choice: ["Spock"],
    beats: ["Scissors", "Rock"],
    loses: ["Lizard", "Paper"]
  }
]

def again
  sleep 1
  puts "Would you like to play again? Yes or No"
  play_again = gets.chomp.capitalize!

  if play_again == "Yes" || play_again == "Y"
    game
  elsif play_again == "No" || play_again == "N"
    return
  else
    puts "Sorry, I didn't get that"
    again
  end
end

def result(user_input, com_input)
  if user_input == com_input
    puts "The game is a draw"
  end

  RULES.select { |obj|
    if obj[:choice].to_s.include?(user_input) && obj[:beats].to_s.include?(com_input)
      puts "Player wins!!"
      return
    elsif obj[:choice].to_s.include?(user_input) && obj[:loses].to_s.include?(com_input)
      puts "Computer wins!!"
      return
    end
    }
end

def game
  com_input = OPTIONS[rand(OPTIONS.length)]

  puts "Rock, Paper, Scissors, Lizard or Spock?"
  user_input = gets.chomp.capitalize!

  if OPTIONS.include?(user_input)
    puts "You chose: #{user_input}"
    sleep 1
    puts "The computer chose: #{com_input}" 
  else 
    puts "Sorry, I didn't get that"
    again
  end

  sleep 1

  result(user_input, com_input)

  again

end

game
