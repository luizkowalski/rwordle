# frozen_string_literal: true

require 'test_helper'

class FakeDictionary < Rwordle::Dictionary
  def initialize(words)
    @word_list = words.is_a?(Array) ? words : words.split(',')
    super()
  end
end
