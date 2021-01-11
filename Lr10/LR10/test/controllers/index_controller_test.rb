require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "server-xslt" do
    get index_output_url(side: 'server')
    assert_includes response.content_type, 'text/html'
  end

  test "client-xslt" do
    get index_output_url(side: 'client-with-xslt')
    assert_includes response.content_type, 'application/xml'
  end

    test "as is" do
    get index_output_url(side: 'client')
    assert_includes response.content_type, 'application/xml'
  end


end
