Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]

=begin
  root to: "tasks#index"
  resources :tasks
=end
end
