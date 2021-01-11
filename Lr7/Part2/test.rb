require './source.rb'
require 'minitest/autorun'

# Class for setting any tests on logic methods
class Tests < MiniTest::Test
  def setup; end

  def test_char_symbol
    char_code = rand(97..122)
    symbol = CharSymbol.new(char_code.chr)
    assert_equal(char_code, symbol.char_code)
    assert_equal(char_code.chr, symbol.symbol)
  end

  def test_record
    char_code = rand(97..122)
    times = rand(1..30)
    record = Record.new(char_code.chr, times)
    assert_equal(char_code, record.char_code)
    assert_equal(char_code.chr, record.symbol)
    assert_equal(times, record.times)
  end

  def test_char_new
    char_code = rand(97..122)
    symbol = CharSymbol.new(char_code.chr)
    times = rand(1..30)
    record = Record.new(char_code.chr, times)

    if (record.is_a?(CharSymbol))
      assert(true)
    end
  end

  # if.is_a?
  # if.instance_of?

  def teardown; end
end