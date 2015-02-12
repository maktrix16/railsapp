require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get chat" do
    get :chat
    assert_response :success
  end

  test "should get insight" do
    get :insight
    assert_response :success
  end

end
