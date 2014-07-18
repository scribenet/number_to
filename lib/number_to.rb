require 'modules/roman_numerals'
require 'modules/alphabetics'
require 'modules/ordinals'
require 'modules/number_words'

module NumberTo
  extend RomanNumerals
  extend Alphabetics
  extend Ordinals
  extend NumberWords
end
