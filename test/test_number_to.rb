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

end
