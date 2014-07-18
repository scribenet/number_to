number_to
=========

Convenience methods for converting Ruby Fixnums to a few String formats.

Pure Ruby, no runtime dependencies. We found it useful to have these in one place with no additional dependencies, hence no cherry-picking from ActiveSupport, etc.

## Install

```
gem install number_to
```

In your file:

```
require 'number_to'
```

And to monkeypatch Fixnum:

```
require 'number_to/fixnum'
```

## Demo

In irb:

```
()$ irb
irb(main):001:0> require 'number_to'
=> true
irb(main):002:0> NumberTo.to_lower_alpha(25)
=> "y"
irb(main):003:0> NumberTo.to_upper_alpha(25)                                                                                                                           
=> "Y"
irb(main):004:0> NumberTo.to_lower_roman(25)                                                                                                                           
=> "xxv"
irb(main):005:0> NumberTo.to_upper_roman(25)                                                                                                                           
=> "XXV"
irb(main):006:0> NumberTo.to_ordinal(25)                                                                                                                               
=> "25th"
irb(main):007:0> NumberTo.to_words(25)
=> "twenty five"
irb(main):008:0> options = {:styled => true, :case => 'upper'}                                                                                                         
=> {:styled=>true, :case=>"upper"}
irb(main):009:0> NumberTo.to_words(25, options)
=> "Twenty-Five"
irb(main):010:0> NumberTo.to_word_ordinal(25, options)
=> "Twenty-Fifth"
irb(main):011:0> require 'number_to/fixnum'
=> true
irb(main):012:0> 1.to_words
=> "one"
irb(main):013:0* 1.to_word_ordinal
=> "first"
```

The methods don't belong to Fixnum by default (no surprises); you have to require `number_to/fixnum`.

## Acknowledgments

The roman numeral methods were taken from roman-numerals, https://github.com/AndrewVos/roman-numerals.

The basic `to_ordinal` method is from ActiveSupport, activesupport/lib/active_support/inflector/methods.rb.

## Other Resources

Not really what you're looking for? Try these:

  - Chronic (https://github.com/mojombo/chronic), a robust NLP date parser
  - numbers_and_words (https://github.com/kslazarev/numbers_and_words), converts numbers to words in multiple languages using the I18n library.

