require 'minitest/autorun'
require_relative 'lr_6_3_source.rb'

class TestBlock < Minitest::Test
    def test_functions
      assert_equal 950.7160847786134, in_block(800) { |x| Math.sin(x)*x }
      assert_equal 950.7160847786134, in_block(800, &->(x) { Math.sin(x)*x } )
      assert_equal 513.6740928604472, in_block(800) { |x| Math.tan(x)}
      assert_equal 513.6740928604472, in_block(800, &->(x) { Math.tan(x) } )
    end
end