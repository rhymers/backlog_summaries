json.extract! project, :id, :archived, :name, :key, :url, :text_formatting_rule, :use_parent_child_issue, :created_at, :updated_at
json.url project_url(project, format: :json)