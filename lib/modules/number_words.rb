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
    '19' => 'nineteen',
    '20' => 'twenty',
    '30' => 'thirty',
    '40' => 'forty',
    '50' => 'fifty',
    '60' => 'sixty',
    '70' => 'seventy',
    '80' => 'eighty',
    '90' => 'ninety'
  }
  INDEX = { 1 => 'thousand',
            2 => 'million',
            3 => 'billion',
            4 => 'trillion'
  }

  def to_words(num)
    num = num.to_s
    arr = num.each_char.to_a
    collector = []
    groups = arr.reverse.each_slice(3).to_a
    groups.each_with_index do |group, i|
      rearrange_group(group)
      words = word_group(group)
      words += ' ' + INDEX[i] if INDEX[i]
      collector << words
    end
    collector.reverse.join(' ')
  end

  def rearrange_group(group)
    group.reverse!
    group.shift while group.first == '0'
  end

  def word_group(group)
    case group.size
      when 0; ''
      when 1; WORDS[group[0]]
      when 2; tenner(group[0], group[1])
      when 3; hundreder(group)
    end
  end

  def hundreder(group)
    [WORDS[group[0]],
     'hundred',
     tenner(group[1], group[2])
    ].reject { |n| n.empty? }.join(' ')
  end

  def tenner(first, second)
    # probably make this a case statement
    return '' if first == '0' and second == '0'
    return WORDS[second] if first == '0' and second != '0'
    return WORDS[first + second] if first == '1'
    return WORDS[first + second] if second == '0'
    WORDS[first + '0'] + ' ' + WORDS[second]
  end
end
