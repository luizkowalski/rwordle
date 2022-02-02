# frozen_string_literal: true

require 'test_helper'
require 'fake_dictionary'

class GuessTest < Minitest::Test
  def test_when_guess_is_right
    dictionary = FakeDictionary.new('test')
    guess = 'test'

    assert(Rwordle::Guess.new(dictionary, guess).correct?)
  end

  def test_when_guess_is_wrong
    dictionary = ::FakeDictionary.new('test')
    guess = 'teste'

    refute(Rwordle::Guess.new(dictionary, guess).correct?)
  end

  def test_when_guess_is_invalid
    dictionary = ::FakeDictionary.new('test')
    guess = 'teste'

    refute(Rwordle::Guess.new(dictionary, guess).valid?)
  end

  def test_correct_color_when_valid
    subject = Rwordle::Guess.new('test', 'test')
    expectation = 'TEST'.chars.map(&:green).join(' ')

    assert_equal(expectation, subject.to_s)
  end

  def test_when_letters_are_misplaced
    subject = Rwordle::Guess.new('test', 'tets')
    expectation = 'TE'.chars.map(&:green)
                      .append('TS'.chars.map(&:yellow)).join(' ')

    assert_equal(expectation, subject.to_s)
  end

  def test_when_user_repeats_a_misplaced_letter
    # Only the first A should be marked as yellow, since there is only one in `MASTE`
    subject = Rwordle::Guess.new('maste', 'aviao')
    expectation = 'A'.chars.map(&:yellow).append('VIAO'.chars.map(&:black)).join(' ')

    assert_equal(expectation, subject.to_s)
  end
end
