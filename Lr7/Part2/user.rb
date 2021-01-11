require './source.rb'

# Symbol class
puts 'Input symbol for creating CharSymbol object:'
arg = gets.chomp
symbol = CharSymbol.new(arg)

puts '@symbol field: ' + symbol.symbol
puts 'char_code method: ' + symbol.char_code.to_s
puts 'print method:'
symbol.print

# Record class
puts 'Input symbol for creating Record object:'
arg_symbol = gets.chomp

puts 'Input number of times for creating Record object:'
arg_times = gets.chomp.to_i
record = Record.new(arg_symbol, arg_times)

puts '@symbol field: ' + record.symbol
puts '@times field: ' + record.times.to_s
puts 'char_code method: ' + record.char_code.to_s
puts 'print method:'
record.print
