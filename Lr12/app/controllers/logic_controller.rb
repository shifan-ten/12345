# frozen_string_literal: true

class LogicController < ApplicationController
  def input; end

  def view

    number = params[:n]
    @result = []
    @intres = []
    @ans = 0
    n = number.to_i
    for i in 1..n
      s = (i**2).to_s
      if s.reverse == s
        @ans += 1
        @result.append(s)
        @intres.append(i.to_s)
      end
    end
  end
end
