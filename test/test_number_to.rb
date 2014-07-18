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
    assert NumberTo.to_words(52) == 'fifty two'
    assert NumberTo.to_words(100) == 'one hundred'
    assert NumberTo.to_words(2005) == 'two thousand five'
    assert NumberTo.to_words(2805) == 'two thousand eight hundred five'
    assert NumberTo.to_words(2895) == 'two thousand eight hundred ninety five'
    assert NumberTo.to_words(32895) == 'thirty two thousand eight hundred ninety five'
    assert NumberTo.to_words(132895) == 'one hundred thirty two thousand eight hundred ninety five'
    assert NumberTo.to_words(20132895) == 'twenty million one hundred thirty two thousand eight hundred ninety five'
  end

  def test_words_with_options
    options = {styled: 1}
    assert NumberTo.to_words(2805, options) == 'two thousand, eight hundred and five'
    assert NumberTo.to_words(20132895, options) == 'twenty million, one hundred and thirty-two thousand, eight hundred and ninety-five'
    options[:case] = 'upper'
    assert NumberTo.to_words(2805, options) == 'Two Thousand, Eight Hundred and Five'
    assert NumberTo.to_words(20132895, options) == 'Twenty Million, One Hundred and Thirty-Two Thousand, Eight Hundred and Ninety-Five'
  end
end
