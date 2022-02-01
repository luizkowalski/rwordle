# frozen_string_literal: true

require 'test_helper'
require 'byebug'

class GuessTest < Minitest::Test
  def test_when_guess_is_right
    word  = 'test'
    guess = 'test'

    assert(Guess.new(word, guess).correct?)
  end

  def test_when_guess_is_wrong
    word  = 'test'
    guess = 'teste'

    refute(Guess.new(word, guess).correct?)
  end

  def test_when_guess_is_invalid
    word  = 'test'
    guess = 'teste'

    refute(Guess.new(word, guess).valid?)
  end

  def test_correct_color_when_valid
    subject = Guess.new('test', 'test')
    expectation = 'TEST'.chars.map(&:green).join(' ')

    assert_equal(expectation, subject.to_s)
  end

  def test_when_letters_are_misplaced
    subject = Guess.new('test', 'tets')
    expectation = 'TE'.chars.map(&:green)
                      .append('TS'.chars.map(&:yellow)).join(' ')

    assert_equal(expectation, subject.to_s)
  end

  def test_when_user_repeats_a_misplaced_letter
    # Only the first A should be marked as yellow, since there is only one in `MASTE`
    subject = Guess.new('maste', 'aviao')
    expectation = 'A'.chars.map(&:yellow).append('VIAO'.chars.map(&:black)).join(' ')

    assert_equal(expectation, subject.to_s)
  end
end
