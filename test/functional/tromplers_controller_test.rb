require 'test_helper'

class TromplersControllerTest < ActionController::TestCase
  setup do
    @trompler = tromplers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tromplers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trompler" do
    assert_difference('Trompler.count') do
      post :create, trompler: { age: @trompler.age, name: @trompler.name, title: @trompler.title }
    end

    assert_redirected_to trompler_path(assigns(:trompler))
  end

  test "should show trompler" do
    get :show, id: @trompler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trompler
    assert_response :success
  end

  test "should update trompler" do
    put :update, id: @trompler, trompler: { age: @trompler.age, name: @trompler.name, title: @trompler.title }
    assert_redirected_to trompler_path(assigns(:trompler))
  end

  test "should destroy trompler" do
    assert_difference('Trompler.count', -1) do
      delete :destroy, id: @trompler
    end

    assert_redirected_to tromplers_path
  end
end
