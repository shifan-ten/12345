# frozen_string_literal: true

require './lr_6_2_source'
require 'minitest/autorun'

# missing top-level docmentation comment
class Test < Minitest::Unit::TestCase
  def test_1
    assert_in_delta((Math.log(2)**2 / 2), integral(0.01), 0.1)
  end
end
