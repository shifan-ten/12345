# frozen_string_literal: true

require './source'

puts 'Enter number of lines:'
n = gets.to_i
puts 'Enter lines:'
lines = []
n.times do
  lines.push(gets)
end
write_to_output_file('F.txt', 'G.txt', lines)
