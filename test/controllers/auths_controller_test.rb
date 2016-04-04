require 'test_helper'

class AuthsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

end
