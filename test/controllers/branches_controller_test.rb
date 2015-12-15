require 'test_helper'

class BranchesControllerTest < ActionController::TestCase
  setup do
    @branch = branches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:branches)
  end

  test "should create branch" do
    assert_difference('Branch.count') do
      post :create, branch: { active: @branch.active, name: @branch.name, school_id: @branch.school_id, slug: @branch.slug }
    end

    assert_response 201
  end

  test "should show branch" do
    get :show, id: @branch
    assert_response :success
  end

  test "should update branch" do
    put :update, id: @branch, branch: { active: @branch.active, name: @branch.name, school_id: @branch.school_id, slug: @branch.slug }
    assert_response 204
  end

  test "should destroy branch" do
    assert_difference('Branch.count', -1) do
      delete :destroy, id: @branch
    end

    assert_response 204
  end
end
