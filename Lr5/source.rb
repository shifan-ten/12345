# frozen_string_literal: true

# This module stores client methods
module Source
  # :reek:NestedIterators
  # :reek:TooManyStatements
  def self.change_grammar_time(*args)
    result = [] # array with the result string sequence
    (0..args.size - 1).each do |count|
      str = args[count].split(' ')
      result_str = str.reduce('') do |sum, word|
        word.gsub!('ing', 'ed') if word.index('ing') == word.size - 3
        sum + word + ' '
      end
      p result_str
      result << result_str
    end

    result
  end

  def self.calc_func(xxx, yyy)
    xxx = xxx.to_i
    yyy = yyy.to_i
    p (2 * Math.cos(xxx - Math::PI / 6)) / (0.5 + Math.sin(yyy)**2)
  end
end
