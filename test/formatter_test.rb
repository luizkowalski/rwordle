# frozen_string_literal: true

require 'test_helper'
require 'fake_dictionary'

class FormatterTest < Minitest::Test
  def test_print_the_right_colors
    distribution = [
      Rwordle::Guess::Distribution.new('a', :correct),
      Rwordle::Guess::Distribution.new('b', :correct),
      Rwordle::Guess::Distribution.new('c', :misplaced),
      Rwordle::Guess::Distribution.new('d', :inexistent)
    ]

    subject = Rwordle::Formatter.new.print(distribution)
    expectation = ['A'.green, 'B'.green, 'C'.yellow, 'D'.black].join(' ')

    assert_equal(expectation, subject)
  end
end
