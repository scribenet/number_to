module NumberWords

  WORDS = {
    '0' => 'zero',
    '1' => 'one',
    '2' => 'two',
    '3' => 'three',
    '4' => 'four',
    '5' => 'five',
    '6' => 'six',
    '7' => 'seven',
    '8' => 'eight',
    '9' => 'nine',
    '10' => 'ten',
    '11' => 'eleven',
    '12' => 'twelve',
    '13' => 'thirteen',
    '14' => 'fourteen',
    '15' => 'fifteen',
    '16' => 'sixteen',
    '17' => 'seventeen',
    '18' => 'eighteen',
    '19' => 'ninteen',
    '20' => 'twenty',
    '30' => 'thirty',
    '40' => 'forty',
    '50' => 'fifty',
    '60' => 'sixty',
    '70' => 'seventy',
    '80' => 'eighty',
    '90' => 'ninety'
  }
  INDEX = { 2 => 'hundred', 3 => 'thousand' }

  def to_words(num)
    num = num.to_s
    arr = num.reverse.each_char.to_a
    arr.each_with_index.map do |n, i|
      next if n == '0'
      w = tens_place?(i) ? tens_state(n) : WORDS[n]
      w += hundreds_state(i) if hundreds_place?(i)
      w
    end.reverse.compact.join(' ')
  end

  def tens_place?(n)
    (n - 1) % 3 == 0
  end

  def tens_state(n)
    return WORDS[n + '0'] unless n == '1'
    'ten'
  end

  def hundreds_place?(i)
    (n - 1) % 3 == 0
  end

  def hundreds_state(i)
  end
end
