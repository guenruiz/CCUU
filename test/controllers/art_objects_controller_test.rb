require 'test_helper'

class ArtObjectsControllerTest < ActionController::TestCase
  setup do
    @art_object = art_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_object" do
    assert_difference('ArtObject.count') do
      post :create, art_object: { description: @art_object.description, name: @art_object.name, route: @art_object.route }
    end

    assert_redirected_to art_object_path(assigns(:art_object))
  end

  test "should show art_object" do
    get :show, id: @art_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_object
    assert_response :success
  end

  test "should update art_object" do
    patch :update, id: @art_object, art_object: { description: @art_object.description, name: @art_object.name, route: @art_object.route }
    assert_redirected_to art_object_path(assigns(:art_object))
  end

  test "should destroy art_object" do
    assert_difference('ArtObject.count', -1) do
      delete :destroy, id: @art_object
    end

    assert_redirected_to art_objects_path
  end
end
