# frozen_string_literal: true

require_relative 'source.rb'
require 'minitest/autorun'

# :reek:FeatureEnvy
# :reek:TooManyStatements
def generate_str_sequence(number_of_times)
  random_input = []
  random_result = []
  number_of_times.times do
    random_str = generate_string
    random_input << random_str[1]
    random_result << random_str[0]
  end

  [random_input, random_result]
end

# :reek:FeatureEnvy
# :reek:TooManyStatements
def generate_string
  random_string = ''
  result_string = ''
  5.times do
    random_word_base = (0...8).map { rand(97..122).chr }.join
    random_string += random_word_base
    result_string += random_word_base
    if rand(0..1) == 1
      random_string += 'ing'
      result_string += 'ed'
    end
    random_string += ' '
    result_string += ' '
  end
  [result_string, random_string]
end

# Class for setting any tests on functions
class Tests < MiniTest::Test
  def setup; end

  def test_calc_func
    assert_equal(-1.4084366469497145, Source.calc_func(41, 2))
    assert_equal(-0.32940836640837823, Source.calc_func(5, 5))
  end

  # :reek:FeatureEnvy
  def test_change_grammar_time
    invoke = generate_str_sequence(3)
    input_strings = invoke[0]
    assert_equal(invoke[1], Source.change_grammar_time(input_strings[0], input_strings[1], input_strings[2]))
  end

  def teardown; end
end
