# frozen_string_literal: true

require_relative 'core_ext/string'
require_relative 'rwordle/guess'
require_relative 'rwordle/game'
require_relative 'rwordle/version'

module Rwordle
  class Error < StandardError; end
end
