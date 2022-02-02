# frozen_string_literal: true

require 'byebug'

module Rwordle
  class Formatter
    POSITION_MATRIX_COLORS = {
      correct: :green,
      misplaced: :yellow,
      inexistent: :black
    }.freeze

    def print(distribution)
      distribution.map do |_, (letter, position)|
        print_letter(letter, position)
      end.join(' ')
    end

    private

    def print_letter(letter, position)
      letter.capitalize.public_send(POSITION_MATRIX_COLORS[position])
    end
  end
end
