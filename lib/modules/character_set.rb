module CharacterSet
  class CharacterSetConverter
    attr_reader :characters, :options, :size
    def initialize(characters, options = {})
      @characters = characters
      options[:repeat] = true unless options.include?(:repeat)
      @options = options
      @size = characters.size
    end

    def to_characters(num)
      num = num.to_i
      repetition = num > size ? calc_repetition(num) : 1
      real_num = num > size ? num % size : num
      real_num = size if real_num == 0
      char = characters[real_num - 1]
      options[:repeat] ? char * repetition : char
    end

    def calc_repetition(num)
      num % size == 0 ? num / size : (num / size) + 1
    end
  end

  ALPH = ("a" .. "z").to_a
  ALPHABETTER = CharacterSetConverter.new(ALPH, {repeat: true})

  def to_character_set(num, characters, options = {})
    CharacterSetConverter.new(characters, options).to_characters(num)
  end

  def to_lower_alpha(num)
    ALPHABETTER.to_characters(num)
  end

  def to_upper_alpha(num)
    to_lower_alpha(num).upcase
  end
end
