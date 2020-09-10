# Intro to Ruby

print "What's your first name? "
first_name = gets.chomp.capitalize!

print "What's your last name? "
last_name = gets.chomp.capitalize!

print "What city do you live in? "
city = gets.chomp.capitalize!

print "'state' abreviation? "
state = gets.chomp.upcase!

puts "#{first_name} #{last_name} #{city} #{state}"


# Control flow in Ruby

print "Pleathe enter a thtring: " 
user_input = gets.chomp

if user_input.include? "s" || "S"
  user_input.gsub!(/s/, "th")
  puts "you string is now: #{user_input}."
else
  print "There are no s characters in your string"
end

if user_input == " "
  print "Pleathe enter a new thtring: " 
  user_input = gets.chomp
end


# Looping with Ruby

puts "Enter text to edit "
text = gets.chomp

puts "Enter word to redact"
redact = gets.chomp

words = text.downcase.split(" ")
words.each do |word|
  if word == redact
    print "REDACTED "
  else
    print word + " "
  end
end


# Arrays and Hashes

puts "Please enter text"
text = gets.chomp

words = text.split(" ")
frequencies = Hash.new(0)

words.each do |word|
  frequencies[word] += 1
end

frequencies = frequencies.sort_by do |word, count|
  count
end

frequencies.reverse!

frequencies.each do |word, count|
  puts "#{word} #{count}"
end


# Refactoring

require 'prime'   # This is a module within Codecademy

def first_n_primes(n)
  return "n must be an integer." unless n.is_a? Integer
  return "n must be greater than 0." if n <= 0
  Prime.first n
end

first_n_primes(10)


# Object-Oriented Programming, Part I

class Computer
  @@users = {}

  def Computer.get_users
    return @@users
  end

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}"
  end

end

my_computer = Computer.new("MAT", "password")


# Object-Oriented Programming, Part I

class Account
  attr_reader :name, :balance 

  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  public

  def display_balance(pin_number)
    puts pin_number == @pin ? "Balance: #{@balance}" : pin_error
  end

  def withdraw(pin_number, amount)
    puts pin_number == @pin ? "Withdrew #{amount}" : pin_error
    @balance -= amount
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    return "Access denied: incorrect PIN."
  end
end

checking_account = Account.new("MAT's", 1000)
