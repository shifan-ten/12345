class IndexController < ApplicationController
  def input
  end

  def output
    @res = []
    @intres = []
    @ans = 0

    n = params[:number].to_i
    for i in 0..n
      s = (i**2).to_s
      if s.reverse == s
        @ans += 1
        @res.append(s)
        @intres.append(i.to_s)
      end
    end

    respond_to do |format|
      format.html
      format.json do
        render json:
          {type: @ans.class.to_s, value_ans: @ans, value_res: @res, value_intres: @intres}
        end
    end

  end
end
