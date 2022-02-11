# frozen_string_literal: true

module Rwordle
  class Formatter
    POSITION_MATRIX_COLORS = {
      correct: :green,
      misplaced: :yellow,
      inexistent: :black
    }.freeze

    def print(distribution)
      formatted = distribution.map do |dist|
        dist.letter.capitalize.public_send(POSITION_MATRIX_COLORS[dist.position])
      end.join(' ')

      puts(formatted)

      formatted
    end
  end
end
