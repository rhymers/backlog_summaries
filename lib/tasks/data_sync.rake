namespace :data_sync do
  task issues: :environment do
    puts "issues sync from backlog!"
    backlog = Backlog4r::User.new(ENV['BACKLOG_SUMMARY_NAME_SPASE'], ENV['BACKLOG_SUMMARY_USER'], ENV['BACKLOG_SUMMARY_PASSWORD'])
    backlog.get_projects.each do |pj|
      Project.where(id: pj["id"]).first_or_create(pj)
    end
    @project_id = 62163

    backlog.find_issue({ projectId: @project_id }).each do |issue|
      Status.where(id: issue["status"]["id"]).first_or_create(issue["status"]) if issue["status"]
      CreatedUser.where(id: issue["created_user"]["id"]).first_or_create(issue["created_user"]) if issue["created_user"]
      Assigner.where(id: issue["assigner"]["id"]).first_or_create(issue["assigner"]) if issue["assigner"]
      IssueType.where(id: issue["issueType"]["id"]).first_or_create(issue["issueType"]) if issue["issueType"]
      if issue["milestones"]
        Milestone.where(id: issue["milestones"][0]["id"]).first_or_create(
          {
            :id => issue["milestones"][0]["id"],
            :name => issue["milestones"][0]["name"],
            :date => issue["milestones"][0]["date"].to_date
          }
        )
      end
      Component.where(id: issue["components"][0]["id"]).first_or_create(issue["components"][0]) if issue["components"]
      Priority.where(id: issue["priority"]["id"]).first_or_create(issue["priority"]) if issue["priority"]
      
      target_issue = Issue.find_or_initialize_by(
        {
          :id => issue["id"],
          :project_id => @project_id
        }
      )
        target_issue.summary = issue["summary"]
        target_issue.component_id = issue["components"][0]["id"] if issue["components"]
        target_issue.created_user_id = issue["created_user"]["id"] if issue["created_user"]
        target_issue.assigner_id = issue["assigner"]["id"] if issue["assigner"]
        target_issue.priority_id = issue["priority"]["id"] if issue["priority"]
        target_issue.url = issue["url"] if issue["url"]
        target_issue.issue_type_id = issue["issueType"]["id"] if issue["issueType"]
        target_issue.estimated_hours = issue["estimated_hours"] if issue["estimated_hours"]
        target_issue.milestone_id = issue["milestones"][0]["id"] if issue["milestones"]
        target_issue.status_id = issue["status"]["id"] if issue["status"]
        target_issue.project_id = @project_id if @project_id
        target_issue.updated_on = issue["updated_on"].to_date if issue["updated_on"]
        target_issue.due_date = issue["due_date"].to_date if issue["due_date"]
        target_issue.created_on = issue["created_on"].to_date if issue["created_on"]
        target_issue.start_date = issue["start_date"].to_date if issue["start_date"]
        target_issue.save!
    end
    puts "Done!"
  end
end

