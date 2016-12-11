Rails.application.routes.draw do
  resources :issues
  resources :priorities
  resources :components
  resources :milestones
  resources :assigners
  resources :issue_types
  resources :created_users
  resources :statuses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  resources :projects
end
