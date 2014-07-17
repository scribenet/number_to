require 'simplecov'
require 'simplecov-html'
require "coveralls"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter,
]

SimpleCov.start do
  add_filter 'test/'
end if ENV['COVERAGE']

require 'minitest'
require 'minitest/unit'
require 'minitest/autorun'
require 'number_to'
