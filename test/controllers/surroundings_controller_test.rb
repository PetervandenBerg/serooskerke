require 'test_helper'

class SurroundingsControllerTest < ActionController::TestCase
  setup do
    @surrounding = surroundings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surroundings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surrounding" do
    assert_difference('Surrounding.count') do
      post :create, surrounding: { description: @surrounding.description, title: @surrounding.title }
    end

    assert_redirected_to surrounding_path(assigns(:surrounding))
  end

  test "should show surrounding" do
    get :show, id: @surrounding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @surrounding
    assert_response :success
  end

  test "should update surrounding" do
    patch :update, id: @surrounding, surrounding: { description: @surrounding.description, title: @surrounding.title }
    assert_redirected_to surrounding_path(assigns(:surrounding))
  end

  test "should destroy surrounding" do
    assert_difference('Surrounding.count', -1) do
      delete :destroy, id: @surrounding
    end

    assert_redirected_to surroundings_path
  end
end
