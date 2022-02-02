# frozen_string_literal: true

module Rwordle
  class Dictionary
    def word_of_the_day
      @word_of_the_day ||= target.sanitize
    end

    def target
      @target ||= word_list.sample
    end

    # TODO: Check if the word exists in the dictionary. Sanitize dictionary before
    def valid_word?(word)
      word.length == target.length
      # && word_list.include?(word)
    end

    def word_list
      @word_list ||= File.readlines('data/top').map(&:chomp)
    end
  end
end
