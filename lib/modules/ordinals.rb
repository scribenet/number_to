# taken straight from activesupport/lib/active_support/inflector/methods.rb
module Ordinals
  def to_ordinal(num)
    "#{num}#{ordinal(num)}"
  end

  def ordinal(number)
    abs_number = number.to_i.abs
    if (11..13).include?(abs_number % 100)
      "th"
    else
      case abs_number % 10
        when 1; "st"
        when 2; "nd"
        when 3; "rd"
        else "th"
      end
    end
  end
end
