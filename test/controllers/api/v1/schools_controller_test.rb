require 'test_helper'

class Api::V1::SchoolsControllerTest < ActionController::TestCase
  setup do
    @api_v1_school = api_v1_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_v1_schools)
  end

  test "should create api_v1_school" do
    assert_difference('Api::V1::School.count') do
      post :create, api_v1_school: { active: @api_v1_school.active, name: @api_v1_school.name, slug: @api_v1_school.slug }
    end

    assert_response 201
  end

  test "should show api_v1_school" do
    get :show, id: @api_v1_school
    assert_response :success
  end

  test "should update api_v1_school" do
    put :update, id: @api_v1_school, api_v1_school: { active: @api_v1_school.active, name: @api_v1_school.name, slug: @api_v1_school.slug }
    assert_response 204
  end

  test "should destroy api_v1_school" do
    assert_difference('Api::V1::School.count', -1) do
      delete :destroy, id: @api_v1_school
    end

    assert_response 204
  end
end
