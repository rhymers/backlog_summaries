require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get issues_url
    assert_response :success
  end

  test "should get new" do
    get new_issue_url
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post issues_url, params: { issue: { assigner_id: @issue.assigner_id, component_id: @issue.component_id, component_id: @issue.component_id, created_on: @issue.created_on, created_user_id: @issue.created_user_id, due_date: @issue.due_date, estimated_hours: @issue.estimated_hours, issue_type_id: @issue.issue_type_id, milestone_id: @issue.milestone_id, priority_id: @issue.priority_id, project_id: @issue.project_id, start_date: @issue.start_date, status_id: @issue.status_id, summary: @issue.summary, updated_on: @issue.updated_on, url: @issue.url } }
    end

    assert_redirected_to issue_url(Issue.last)
  end

  test "should show issue" do
    get issue_url(@issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_url(@issue)
    assert_response :success
  end

  test "should update issue" do
    patch issue_url(@issue), params: { issue: { assigner_id: @issue.assigner_id, component_id: @issue.component_id, component_id: @issue.component_id, created_on: @issue.created_on, created_user_id: @issue.created_user_id, due_date: @issue.due_date, estimated_hours: @issue.estimated_hours, issue_type_id: @issue.issue_type_id, milestone_id: @issue.milestone_id, priority_id: @issue.priority_id, project_id: @issue.project_id, start_date: @issue.start_date, status_id: @issue.status_id, summary: @issue.summary, updated_on: @issue.updated_on, url: @issue.url } }
    assert_redirected_to issue_url(@issue)
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete issue_url(@issue)
    end

    assert_redirected_to issues_url
  end
end
