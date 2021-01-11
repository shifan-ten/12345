# frozen_string_literal: true

# controllers
class MethodController < ApplicationController
  def input; end

  def main_logic(number)
    # stuck on 98798674657
    calc = Enumerator.new do |check_func|
      index = 0
      loop do
        number = number + reverse_number(number)
        check_func.yield number
        index += 1
        if (index > 10000) 
          return "Execution time expired" + " (> 10 000 iterations)"
        end
      end
    end
    result = calc.take_while { |calc_value, index| (not palindrome?(calc_value)) }
    result.push(number)
  end

  def view
    number = params[:number]

    #---------------validation-----------------#
    if (number.to_i == 0) and (number != "0") 
      @result = "Please, input valid number"
    else
    #---------------end-validation-----------------#
      if (res = Result.find_by_value(number.to_i))
        @result = ActiveSupport::JSON.decode(res.result)
      else
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
        res = Result.create value: number.to_i, result: ActiveSupport::JSON.encode(@result)
        res.save
      end 
    end

    respond_to do |format|
      format.html 
      format.json do
        render json:
          { type_result: @result.class.to_s, value_result: @result }
      end
    end 
  end

  def results
    result = Result.all.map { |el| { value: el.value, result: ActiveSupport::JSON.decode(el.result) } }

    # http://127.0.0.1:3000/method/results.xml
    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

end
