require 'test_helper'

class ChatControllerTest < ActionController::TestCase
  test "should get posts" do
    get :posts
    assert_response :success
  end

  test "should get messages" do
    get :messages
    assert_response :success
  end

end
