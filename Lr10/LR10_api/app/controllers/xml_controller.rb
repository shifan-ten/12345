class XmlController < ApplicationController
    before_action :parse_params, only: :index

    def index
        @result = []
        @intres = []
        @ans = 0

        for i in 0..@n
            s = (i**2).to_s
            if s.reverse == s
                @ans += 1
                @result.append(s)
                @intres.append(i.to_s)
            end
        end

        data = @intres.map { |elem| { elem: elem, binary: elem.to_i**2 } }
        respond_to do |format|
            format.xml { render xml: data.to_xml }
            format.rss { render xml: data.to_xml }
        end

    end

    def parse_params
        @n = params[:n].to_i
    end
end
