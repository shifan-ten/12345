class IndexController < ApplicationController
  def input


    @result = []
    @intres = []
    @ans = 0
    if params[:n]
      n = params[:n].to_i
      for i in 0..n
        s = (i**2).to_s
        if s.reverse == s
          @ans += 1
          @result.append(s)
          @intres.append(i.to_s)
        end
      end

    else
      @error = 'Ошибка'
    end

  end


  def output

  end
end
