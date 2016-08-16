Rails.application.routes.draw do
  resources :issues, only: [:show, :create, :index, :new]
  root to: 'issues#index'
end
