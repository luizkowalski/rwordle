# frozen_string_literal: true

class Guess
  def initialize(target, guess)
    @target = target
    @guess  = guess
    @result = []
  end

  def correct?
    guess == target
  end

  # TODO: Validate against the target list too
  def valid?
    guess.length == target.length
  end

  def to_s
    find_correct_letters
    find_misplaced_letters

    result.join(' ')
  end

  private

  def find_correct_letters
    guess.chars.each.with_index do |letter, index|
      if target_chars[index] == letter
        result[index] = letter.capitalize.green
        target_chars[index] = nil
      end
    end
  end

  def find_misplaced_letters
    guess.chars.each.with_index do |letter, index|
      next unless result[index].nil?

      result[index] = if target_chars.include?(letter)
                        target_chars[target_chars.index(letter)] = nil
                        letter.capitalize.yellow
                      else
                        letter.capitalize.black
                      end
    end
  end

  def target_chars
    @target_chars ||= target.chars
  end

  attr_reader :target, :guess, :result
end
