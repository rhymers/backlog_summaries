require 'test_helper'

class CreatedUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @created_user = created_users(:one)
  end

  test "should get index" do
    get created_users_url
    assert_response :success
  end

  test "should get new" do
    get new_created_user_url
    assert_response :success
  end

  test "should create created_user" do
    assert_difference('CreatedUser.count') do
      post created_users_url, params: { created_user: { name: @created_user.name } }
    end

    assert_redirected_to created_user_url(CreatedUser.last)
  end

  test "should show created_user" do
    get created_user_url(@created_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_created_user_url(@created_user)
    assert_response :success
  end

  test "should update created_user" do
    patch created_user_url(@created_user), params: { created_user: { name: @created_user.name } }
    assert_redirected_to created_user_url(@created_user)
  end

  test "should destroy created_user" do
    assert_difference('CreatedUser.count', -1) do
      delete created_user_url(@created_user)
    end

    assert_redirected_to created_users_url
  end
end
