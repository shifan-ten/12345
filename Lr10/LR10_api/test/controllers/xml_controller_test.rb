require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'check rss format' do
    get '/', params: { n: 10, format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end
end
