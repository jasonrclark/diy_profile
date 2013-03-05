require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get start" do
    get :start
    assert_redirected_to root_url
  end

  test "should get stop" do
    get :stop
    assert_redirected_to root_url
  end
end
