require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schools)
  end

  test "should create school" do
    assert_difference('School.count') do
      post :create, school: { active: @school.active, name: @school.name }
    end

    assert_response 201
  end

  test "should show school" do
    get :show, id: @school
    assert_response :success
  end

  test "should update school" do
    put :update, id: @school, school: { active: @school.active, name: @school.name }
    assert_response 204
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete :destroy, id: @school
    end

    assert_response 204
  end
end
