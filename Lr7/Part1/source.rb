# frozen_string_literal: true

def create_input_file(file_name, lines)
  File.open(file_name, 'w') do |file|
    lines.each { |line| file.puts line }
  end
end

def write_to_output_file(input_file_name, output_file_name, lines)
  create_input_file(input_file_name, lines)
  File.open(output_file_name, 'w') do |output|
    File.open(input_file_name, 'r') do |input|
      output.write input.read&.downcase
    end
  end
end
