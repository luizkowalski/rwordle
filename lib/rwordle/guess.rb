# frozen_string_literal: true

module Rwordle
  class Guess
    def initialize(dictionary, word)
      @dictionary = dictionary
      @word       = word
      @result     = {}
      find_correct_letters && find_misplaced_letters
    end

    def correct?
      word == dictionary.word_of_the_day
    end

    def valid?
      dictionary.valid_word?(word)
    end

    def distribution
      result.sort.to_h
    end

    private

    def find_correct_letters
      word.chars.each.with_index do |letter, index|
        if target_chars[index] == letter
          result[index] = [letter, :correct]
          target_chars[index] = nil
        end
      end
    end

    def find_misplaced_letters
      word.chars.each.with_index do |letter, index|
        next unless result[index].nil?

        result[index] = if target_chars.include?(letter)
                          target_chars[target_chars.index(letter)] = nil
                          [letter, :misplaced]
                        else
                          [letter, :inexistent]
                        end
      end
    end

    def target_chars
      @target_chars ||= dictionary.word_of_the_day.chars
    end

    attr_reader :dictionary, :word, :result
  end
end
