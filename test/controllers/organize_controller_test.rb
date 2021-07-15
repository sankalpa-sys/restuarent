require 'test_helper'

class OrganizeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get organize_new_url
    assert_response :success
  end

end
