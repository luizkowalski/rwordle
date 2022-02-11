# frozen_string_literal: true

module Rwordle
  class Guess
    Distribution = Struct.new(:letter, :position)

    def initialize(dictionary, word)
      @dictionary   = dictionary
      @word         = word
      @distribution = []
      find_correct_letters && find_misplaced_letters
    end

    def correct?
      word == dictionary.word_of_the_day
    end

    def valid?
      dictionary.valid_word?(word)
    end

    attr_reader :distribution

    private

    def find_correct_letters
      word.chars.each.with_index do |letter, index|
        if target_chars[index] == letter
          distribution[index] = Distribution.new(letter, :correct)
          target_chars[index] = nil
        end
      end
    end

    def find_misplaced_letters
      word.chars.each.with_index do |letter, index|
        next unless distribution[index].nil?

        distribution[index] = if target_chars.include?(letter)
                                target_chars[target_chars.index(letter)] = nil
                                Distribution.new(letter, :misplaced)
                              else
                                Distribution.new(letter, :inexistent)
                              end
      end
    end

    def target_chars
      @target_chars ||= dictionary.word_of_the_day.chars
    end

    attr_reader :dictionary, :word
  end
end
