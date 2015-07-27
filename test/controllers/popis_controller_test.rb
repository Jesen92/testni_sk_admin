require 'test_helper'

class PopisControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
