Rails.application.routes.draw do
  root to: 'toppages#index'

=begin
  root to: "tasks#index"
  resources :tasks
=end
end
