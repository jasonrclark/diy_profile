require 'test_helper'

class TromplesControllerTest < ActionController::TestCase
  setup do
    @tromple = tromples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tromples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tromple" do
    assert_difference('Tromple.count') do
      post :create, tromple: { intensity: @tromple.intensity, name: @tromple.name }
    end

    assert_redirected_to tromple_path(assigns(:tromple))
  end

  test "should show tromple" do
    get :show, id: @tromple
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tromple
    assert_response :success
  end

  test "should update tromple" do
    put :update, id: @tromple, tromple: { intensity: @tromple.intensity, name: @tromple.name }
    assert_redirected_to tromple_path(assigns(:tromple))
  end

  test "should destroy tromple" do
    assert_difference('Tromple.count', -1) do
      delete :destroy, id: @tromple
    end

    assert_redirected_to tromples_path
  end
end
