#!/usr/bin/env ruby

bank = ["apple", "banana", "orange", "mango", "lemon", "pineapple", "coconut", "grapes"]
guesses_left = 8
answer = bank.sample
letters = answer.split("")
old_guesses = []
word = {}
count = 0

letters.each do |x|
  word[x] = false
end

puts "Welcome to hangman!"
puts "Once you know the whole word, type it in to win!"

while count == 0
  print "Word: "
  letters.each do |x|
    if word[x] == true
      print x
    else
      print "_"
    end
  end

  puts ""
  puts "Chances remaining: #{guesses_left}"
  print "Guess a single letter (a-z or A-Z) or the entire word: "
  input = gets.chomp.downcase

  if input.match(/\A[a-zA-Z]+\z/) == nil
    puts "That is not a valid input"
  else
    if letters.include?(input)
      word[input] = true
      old_guesses << input
    elsif old_guesses.include?(input)
      puts "You already guessed #{input}. Please try again."
    else
      old_guesses << input
      guesses_left -= 1
    end
    if input.length > 1 || guesses_left == 0
      count = 1
    end
  end
end

if input == answer
  puts "Congratulations! You guessed the word."
elsif input != answer
  puts "You lose. Better luck next time."
end
