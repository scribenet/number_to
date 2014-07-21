class Fixnum
  def to_upper_roman
    NumberTo.to_upper_roman(self)
  end
  def to_lower_roman
    NumberTo.to_lower_roman(self)
  end
  def to_upper_alpha
    NumberTo.to_upper_alpha(self)
  end
  def to_lower_alpha
    NumberTo.to_lower_alpha(self)
  end
  def to_ordinal
    NumberTo.to_ordinal(self)
  end
  def to_words(options = {})
    NumberTo.to_words(self, options)
  end
  def to_word_ordinal(options = {})
    NumberTo.to_word_ordinal(self, options)
  end
  def to_character_set(characters, options = {})
    NumberTo.to_character_set(self, characters, options)
  end
end

