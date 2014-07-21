module NumberWords
  DATA_FILE = File.read(File.join(File.dirname(__FILE__), '../data/number_words.yml'))
  DAT = YAML.load(DATA_FILE)
  WORDS = DAT[:words]
  LARGE_NUMS = DAT[:large_nums]
  ORDINALS = DAT[:ordinals]

  def to_words(num, options = {})
    NumbersToWords.new(options).to_words(num)
  end

  def to_word_ordinal(num, options = {})
    text = NumbersToWords.new(options).to_words(num)
    change_last_word(text)
  end

  def change_last_word(text)
    words = text.split(/(\W)/)
    last = words[words.size - 1]
    new_last = ordinal_word(last)
    words[words.size - 1] = new_last
    words.join
  end

  def ordinal_word(word)
    ORDINALS[word] || word += 'th'
  end

  class NumbersToWords
    attr_reader :num, :options
    attr_reader :hundred, :large_nums
    DEFAULTS = {styled: false, case: 'lower', space: ' '}

    def initialize(options = {})
      @options = DEFAULTS.merge(options)
      set_style_opts
    end

    def set_style_opts
      @hundred = options[:styled] ? 'hundred and' : 'hundred'
      @large_nums = options[:styled] ? large_nums_with_commas : LARGE_NUMS
    end

    def large_nums_with_commas
      large_nums = LARGE_NUMS.dup
      large_nums.each { |k,v| large_nums[k] = "#{v}," }
      large_nums
    end

    def to_words(num)
      arr = num.to_s.each_char.to_a
      groups = arr.reverse.each_slice(3).to_a
      collector = words_for_groups(groups)
      formatted_words(collector)
    end

    def formatted_words(collector)
      words = collector.reverse.join(options[:space]).gsub(/,$/,'')
      return words unless options[:case] == 'upper'
      words.split(/(\W)/).map(&:capitalize).join.gsub(/ and/i, ' and')
    end

    def words_for_groups(groups)
      collector = []
      groups.each_with_index do |group, i|
        next if group.all? { |e| e == '0' }
        rearrange_group(group)
        words = word_group(group, i)
        collector << words
      end
      collector
    end

    def rearrange_group(group)
      group.reverse!
      group.shift while group.first == '0'
    end

    def word_group(group, i)
      words = basic_word_group(group)
      words += options[:space] + large_nums[i] if large_nums[i]
      words
    end

    def basic_word_group(group)
      case group.size
        when 0; ''
        when 1; WORDS[group[0]]
        when 2; tenner(group[0], group[1])
        when 3; hundreder(group)
      end
    end

    def hundreder(group)
      tens = tenner(group[1], group[2])
      hundred_joiner = tens.empty? ? 'hundred' : hundred
      [WORDS[group[0]],
       hundred_joiner,
       tens
      ].reject { |n| n.empty? }.join(options[:space])
    end

    def tenner(first, second)
      return '' if first == '0' and second == '0'
      return WORDS[second] if first == '0' and second != '0'
      return WORDS[first + second] if first == '1' or second == '0'
      joined_tenner(first, second)
    end

    def joined_tenner(first, second)
      joiner = options[:styled] ? '-' : options[:space]
      WORDS[first + '0'] + joiner + WORDS[second]
    end
  end
end

