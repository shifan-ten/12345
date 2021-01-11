# frozen_string_literal: true

require 'test_helper'

class MethodControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get method_input_url
    assert_response :success
  end

  test 'should get view' do
    get method_view_url
    assert_response :success
  end

  test 'test_return_json' do
    get method_view_url, params: { number: 100, format: 'json' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/json'
  end

  test 'test_record_in_db' do
    before = Result.count
    get method_view_url, params: { number: 10000 }
    after = Result.count

    assert_equal before + 1, after
  end

  test 'test_different_response_json' do
    get method_view_url, params: { number: 1000, format: 'json' }
    first = JSON.parse @response.body

    get method_view_url, params: { number: 10000, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second
  end

end
