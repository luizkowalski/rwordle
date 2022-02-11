# frozen_string_literal: true

require 'test_helper'
require 'fake_dictionary'

class GuessTest < Minitest::Test
  def setup
    @dictionary = ::FakeDictionary.new('test')
  end

  def test_when_guess_is_right
    guess = 'test'

    assert(Rwordle::Guess.new(@dictionary, guess).correct?)
  end

  def test_when_guess_is_wrong
    guess = 'teste'

    refute(Rwordle::Guess.new(@dictionary, guess).correct?)
  end

  def test_when_guess_is_invalid
    guess = 'teste'

    refute(Rwordle::Guess.new(@dictionary, guess).valid?)
  end

  def test_when_guess_is_correct
    subject = Rwordle::Guess.new(@dictionary, 'test')
    expectation = [
      Rwordle::Guess::Distribution.new('t', :correct),
      Rwordle::Guess::Distribution.new('e', :correct),
      Rwordle::Guess::Distribution.new('s', :correct),
      Rwordle::Guess::Distribution.new('t', :correct)
    ]

    assert_equal(expectation, subject.distribution)
  end

  def test_when_letters_are_misplaced
    subject = Rwordle::Guess.new(@dictionary, 'tets')
    expectation = [
      Rwordle::Guess::Distribution.new('t', :correct),
      Rwordle::Guess::Distribution.new('e', :correct),
      Rwordle::Guess::Distribution.new('t', :misplaced),
      Rwordle::Guess::Distribution.new('s', :misplaced)
    ]

    assert_equal(expectation, subject.distribution)
  end

  def test_when_user_repeats_a_misplaced_letter
    # Only the first A should be marked as misplaced, since there is only one in `MASTE`
    dictionary = ::FakeDictionary.new('maste')
    subject = Rwordle::Guess.new(dictionary, 'aviao')
    expectation = [
      Rwordle::Guess::Distribution.new('a', :misplaced),
      Rwordle::Guess::Distribution.new('v', :inexistent),
      Rwordle::Guess::Distribution.new('i', :inexistent),
      Rwordle::Guess::Distribution.new('a', :inexistent),
      Rwordle::Guess::Distribution.new('o', :inexistent)
    ]

    assert_equal(expectation, subject.distribution)
  end
end
