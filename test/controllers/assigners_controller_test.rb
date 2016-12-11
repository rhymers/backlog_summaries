require 'test_helper'

class AssignersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assigner = assigners(:one)
  end

  test "should get index" do
    get assigners_url
    assert_response :success
  end

  test "should get new" do
    get new_assigner_url
    assert_response :success
  end

  test "should create assigner" do
    assert_difference('Assigner.count') do
      post assigners_url, params: { assigner: { name: @assigner.name } }
    end

    assert_redirected_to assigner_url(Assigner.last)
  end

  test "should show assigner" do
    get assigner_url(@assigner)
    assert_response :success
  end

  test "should get edit" do
    get edit_assigner_url(@assigner)
    assert_response :success
  end

  test "should update assigner" do
    patch assigner_url(@assigner), params: { assigner: { name: @assigner.name } }
    assert_redirected_to assigner_url(@assigner)
  end

  test "should destroy assigner" do
    assert_difference('Assigner.count', -1) do
      delete assigner_url(@assigner)
    end

    assert_redirected_to assigners_url
  end
end
