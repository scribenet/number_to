# encoding: UTF-8
require_relative 'test_helper'

class NumberToTests < Minitest::Test

  def test_upper_roman
    assert NumberTo.to_upper_roman(1) == 'I'
    assert NumberTo.to_upper_roman(12) == 'XII'
    assert NumberTo.to_upper_roman(594) == 'DXCIV'
  end

  def test_lower_roman
    assert NumberTo.to_lower_roman(1) == 'i'
    assert NumberTo.to_lower_roman(12) == 'xii'
    assert NumberTo.to_lower_roman(594) == 'dxciv'
  end

  def test_upper_alpha
    assert NumberTo.to_upper_alpha(1) == 'A'
    assert NumberTo.to_upper_alpha(12) == 'L'
    assert NumberTo.to_upper_alpha(79) == 'AAAA'
  end

  def test_lower_alpha
    assert NumberTo.to_lower_alpha(1) == 'a'
    assert NumberTo.to_lower_alpha(12) == 'l'
    assert NumberTo.to_lower_alpha(79) == 'aaaa'
  end

  def test_ordinal
    assert NumberTo.to_ordinal(1) == '1st'
    assert NumberTo.to_ordinal(12) == '12th'
    assert NumberTo.to_ordinal(803) == '803rd'
  end

  def test_words
    assert NumberTo.to_words(100) == 'one hundred'
    assert NumberTo.to_words(2005) == 'two thousand five'
    assert NumberTo.to_words(2805) == 'two thousand eight hundred five'
    assert NumberTo.to_words(2895) == 'two thousand eight hundred ninety five'
    assert NumberTo.to_words(32895) == 'thirty two thousand eight hundred ninety five'
    assert NumberTo.to_words(132895) == 'one hundred thirty two thousand eight hundred ninety five'
  end
end
