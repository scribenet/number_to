# adapted without any substanial changes from https://github.com/AndrewVos/roman-numerals
module RomanNumerals
  BASE_DIGITS = {
    1 => 'I',
    4 => 'IV',
    5 => 'V',
    9 => 'IX',
    10 => 'X',
    40 => 'XL',
    50 => 'L',
    90 => 'XC',
    100 => 'C',
    400 => 'CD',
    500 => 'D',
    900 => 'CM',
    1000 => 'M'
  }

  def to_upper_roman(value)
    result = ''
    BASE_DIGITS.keys.reverse.each do |decimal|
      while value >= decimal
        value -= decimal
        result += BASE_DIGITS[decimal]
      end
    end
    result
  end

  def to_lower_roman(value)
    to_upper_roman(value).downcase
  end
end
