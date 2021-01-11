# frozen_string_literal: true

# rubocop is intolerable to long methods so this is my fate
def output(counter, ksi, res, control_res)
  puts "#{counter} steps"
  puts "Ksi: #{ksi}"
  puts "Loop result: #{res}"
  puts "Control result: #{control_res}"
end

# and it still hates me because [15/10]
def integral(ksi)
  control_res = Math.log(2)**2 / 2
  iteration_counter = 0
  res = 0
  x = 1
  dx = 0.001
  loop do
    y = Math.log(x) / x
    res += 0.001 * y
    iteration_counter += 1
    x += dx
    break if x >= 2.0
    break if (control_res - res).abs <= ksi
  end
  output(iteration_counter, ksi, res, control_res)
  res
end
