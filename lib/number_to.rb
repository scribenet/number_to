require 'modules/roman_numerals'
require 'modules/ordinals'
require 'modules/number_words'
require 'modules/character_set'

module NumberTo
  extend RomanNumerals
  extend Ordinals
  extend NumberWords
  extend CharacterSet
end
