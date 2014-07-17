module Alphabetics
  def to_upper_alpha(num)
    to_lower_alpha(num).upcase
  end

  def to_lower_alpha(num)
    num_to_alph(num)
  end

  ALPH = ("a" .. "z").to_a

  def num_to_alph(num)
    num = num.to_i
    repetition = num > 26 ? calc_repetition(num) : 1
    real_num = num > 26 ? num % 26 : num
    real_num = 26 if real_num == 0
    ALPH[real_num - 1] * repetition
  end

  def calc_repetition(num)
    num % 26 == 0 ? num / 26 : (num / 26) + 1
  end
end
