# frozen_string_literal: true

require 'test_helper'
require 'fake_dictionary'

class FormatterTest < Minitest::Test
  def test_print_the_right_colors
    distribution = { 0 => ['a', :correct], 1 => ['b', :correct], 2 => ['c', :misplaced], 3 => ['d', :inexistent] }
    subject = Rwordle::Formatter.new.print(distribution)
    expectation = ['A'.green, 'B'.green, 'C'.yellow, 'D'.black].join(' ')

    assert_equal(expectation, subject)
  end
end
