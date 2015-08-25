require 'test_helper'

class AndroidControllerTest < ActionController::TestCase
  test "should get get_json" do
    get :get_json
    assert_response :success
  end

end
