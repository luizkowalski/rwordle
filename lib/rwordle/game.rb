# frozen_string_literal: true

class Game
  def initialize
    word_of_the_day
    @guesses = []
  end

  def play
    puts target.chars.map { '_' }.join(' ')

    1.upto(6) do |turn|
      puts "Turn #{turn}: ".red
      guesses.each { |guess| puts guess }
      guess_string = gets.chomp.downcase.sanitize
      system('cls') || system('clear')

      guess = Guess.new(sanitized_target, guess_string)

      unless guess.valid?
        puts 'Invalid guess. Try again.'
        redo
      end

      guesses << guess

      if guesses.last.correct?
        puts 'You won!'
        break
      end
    end

    guesses.each { |guess| puts guess }

    puts "The word was #{target.upcase.blue}" # For testing/debugging purposes
  end

  def word_of_the_day
    @target = word_list.sample
    @sanitized_target = @target.sanitize
  end

  private

  def word_list
    @word_list ||= File.readlines('data/top').map(&:chomp)
  end

  attr_reader :target, :guesses, :sanitized_target
end
