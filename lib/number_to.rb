require 'modules/roman_numerals'
require 'modules/alphabetics'
require 'modules/ordinals'
require 'modules/number_words'
require 'modules/character_set'

module NumberTo
  extend RomanNumerals
  extend Alphabetics
  extend Ordinals
  extend NumberWords
  extend CharacterSet
end
