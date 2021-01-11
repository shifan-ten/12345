# frozen_string_literal: true

def integral(ksi)
  control_res = Math.log(2)**2 / 2
  result = Enumerator.new do |sum|
    x = 1.0
    loop do
      sum << (Math.log(x) / x) * 0.001
      x += 0.001
    end
  end
  current_res = 0
  result.take_while { |sum|
    current_res += sum
    (control_res - current_res).abs >= ksi
  }.inject(0, :+)
end
