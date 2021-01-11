# base class
class CharSymbol
  attr_accessor :symbol
  def initialize(symbol)
    @symbol = symbol
  end

  def char_code
    @symbol.ord
  end

  def print
    puts @symbol
  end
end

# class ancestor
class Record < CharSymbol
  attr_accessor :times
  def initialize(symbol, times)
    super(symbol)
    @times = times
  end

  def print
    puts((0..@times - 1).reduce('') { |sum| sum + @symbol })
  end
end
