# frozen_string_literal: true

module Rwordle
  class Formatter
    POSITION_MATRIX_COLORS = {
      correct: :green,
      misplaced: :yellow,
      inexistent: :black
    }.freeze

    def print(distribution)
      formatted = distribution.map do |_, (letter, position)|
        print_letter(letter, position)
      end.join(' ')

      puts(formatted)

      formatted
    end

    private

    def print_letter(letter, position)
      letter.capitalize.public_send(POSITION_MATRIX_COLORS[position])
    end
  end
end
