# frozen_string_literal: true

require 'colorize'

module CoreExt
  module String
    ACCENTS_MAPPING = {
      'a' => [224, 225, 226, 227, 228, 229, 230],
      'e' => [232, 233, 234, 235],
      'c' => [231],
      'i' => [236, 237, 238, 239],
      'o' => [242, 243, 244, 245, 246, 248],
      'u' => [249, 250, 251, 252],
      'n' => [241],
      'y' => [253, 255],
      'ae' => [346],
      'oe' => [189]
    }.freeze

    def sanitize
      sanitize_string = ::String.new(self)
      ACCENTS_MAPPING.each do |letter, accents|
        packed = accents.pack('U*')
        rxp    = Regexp.new("[#{packed}]", nil)
        sanitize_string.gsub!(rxp, letter)
      end

      sanitize_string
    end

    def green
      colorize(background: :green, color: :black)
    end

    def yellow
      colorize(background: :yellow, color: :black)
    end

    def black
      colorize(background: :black, color: :white)
    end

    def blue
      colorize(background: :blue, color: :black)
    end
  end
end

String.prepend CoreExt::String
