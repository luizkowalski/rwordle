# frozen_string_literal: true

module Rwordle
  class Game
    def initialize(dictionary = Rwordle::Dictionary.new, formatter = Rwordle::Formatter.new)
      @dictionary = dictionary
      @formatter  = formatter
      @guesses    = []
    end

    def play
      puts(dictionary.word_of_the_day.chars.map { '_' }.join(' '))

      1.upto(6) do |turn|
        puts("Turn #{turn}: ".red)
        show_guesses
        word = gets.chomp.downcase.sanitize
        system('cls') || system('clear')

        guess = Rwordle::Guess.new(dictionary, word)

        unless guess.valid?
          puts('Invalid guess. Try again.')
          redo
        end

        guesses << guess

        break puts('You won!') if guess.correct?
      end

      show_guesses

      puts("The word was #{dictionary.target.upcase.blue}") # For testing/debugging purposes)
    end

    private

    def show_guesses
      guesses.each do |guess|
        puts(formatter.print(guess.distribution))
      end
    end

    attr_reader :dictionary, :guesses, :formatter
  end
end
