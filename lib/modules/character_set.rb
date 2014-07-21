module CharacterSet

  def to_character_set(num, characters, options)
    CharacterSetConverter.new(characters, options).to_characters(num)
  end

  class CharacterSetConverter
    attr_reader :characters, :options, :size
    def initialize(characters, options)
      @characters = characters
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
end
