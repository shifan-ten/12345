# frozen_string_literal: true

require './source.rb'

# :reek:ManualDispatch
# :reek:UtilityFunction
def execute(method_name, *args)
  Source.public_send(method_name, *args) if Source.respond_to? method_name
end

# :reek:TooManyStatements
def start
  puts 'What program do you want to execute?'
  p Source.methods - Object.methods
  puts "Please, enter a number, corresponding to the func position in the list.
Then enter arguments, if needed (type 'stop' to stop):"
  response = gets.chomp.to_i
  puts 'enter arguments, if needed'
  arguments = gets('stop').chomp('stop')
  [response, arguments]
end

start_response = start
response = start_response[0]
arguments = start_response[1]
method_names = (Source.methods - Object.methods)
MIN_POSITION = 1
if response && response >= MIN_POSITION && response <= method_names.size
  name = method_names[response.to_i - 1]
  formatted_arguments = arguments.split("\n")

  case formatted_arguments.size
  when 0
    execute(name)
  when 1
    execute(name, formatted_arguments[0])
  when 2
    execute(name, formatted_arguments[0], formatted_arguments[1])
  when 3
    execute(name,
            formatted_arguments[0],
            formatted_arguments[1],
            formatted_arguments[2])
  when 4
    execute(name, formatted_arguments[0],
            formatted_arguments[1],
            formatted_arguments[2],
            formatted_arguments[3])
  else
    puts 'Too many arguments'
  end

end
