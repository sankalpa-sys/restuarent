require 'test_helper'

class KhaltiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get khalti_index_url
    assert_response :success
  end

end
