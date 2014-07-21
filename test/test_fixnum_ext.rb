# encoding: UTF-8
require_relative 'test_helper'
require 'number_to/fixnum'

class NumberToTests < Minitest::Test
  def test_fixnum_upper_roman
    assert 1.to_upper_roman == 'I'
    assert 12.to_upper_roman == 'XII'
    assert 594.to_upper_roman == 'DXCIV'
  end

  def test_fixnum_lower_roman
    assert 1.to_lower_roman == 'i'
    assert 12.to_lower_roman == 'xii'
    assert 594.to_lower_roman == 'dxciv'
  end

  def test_fixnum_upper_alpha
    assert 1.to_upper_alpha == 'A'
    assert 12.to_upper_alpha == 'L'
    assert 79.to_upper_alpha == 'AAAA'
  end

  def test_fixnum_lower_alpha
    assert 1.to_lower_alpha == 'a'
    assert 12.to_lower_alpha == 'l'
    assert 79.to_lower_alpha == 'aaaa'
  end

  def test_fixnum_ordinal
    assert 1.to_ordinal == '1st'
    assert 12.to_ordinal == '12th'
    assert 803.to_ordinal == '803rd'
  end

  def test_fixnum_words
    assert 52.to_words == 'fifty two'
    assert 100.to_words == 'one hundred'
    assert 2005.to_words == 'two thousand five'
    assert 2805.to_words == 'two thousand eight hundred five'
    assert 2895.to_words == 'two thousand eight hundred ninety five'
    assert 32895.to_words == 'thirty two thousand eight hundred ninety five'
    assert 132895.to_words == 'one hundred thirty two thousand eight hundred ninety five'
    assert 20132895.to_words == 'twenty million one hundred thirty two thousand eight hundred ninety five'
    assert 100000000.to_words == 'one hundred million'
  end

  def test_fixnum_words_with_options
    options = {styled: 1}
    assert 2805.to_words(options) == 'two thousand, eight hundred and five'
    assert 20132895.to_words(options) == 'twenty million, one hundred and thirty-two thousand, eight hundred and ninety-five'
    options[:case] = 'upper'
    assert 2805.to_words(options) == 'Two Thousand, Eight Hundred and Five'
    assert 20132895.to_words(options) == 'Twenty Million, One Hundred and Thirty-Two Thousand, Eight Hundred and Ninety-Five'
  end

  def test_fixnum_to_word_ordinal
    options = {styled: 1}
    assert 61.to_word_ordinal(options) == 'sixty-first'
    assert 2805.to_word_ordinal(options) == 'two thousand, eight hundred and fifth'
    assert 100000.to_word_ordinal(options) == 'one hundred thousandth'
    assert 1000000.to_word_ordinal(options) == 'one millionth'
    assert 1000000000.to_word_ordinal(options) == 'one billionth'
  end

  def test_fixnum_to_character_set
    assert 3.to_character_set(['#', '$'], {repeat: true}) == '##'
    assert 3.to_character_set(['#', '$'], {repeat: false}) == '#'
    notes = %w(* † ‡ ¶)
    assert 12.to_character_set(notes, {repeat: false}) == '¶'
    assert 21.to_character_set(notes, {repeat: false}) == '*'
  end
end
