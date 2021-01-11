require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
    test "test result with correct number" do
        get "/", params: { n: 100 }
        result = assigns[:result]
        last_number = result[result.size - 1]
        assert_equal last_number.to_i, 676
    end

end
