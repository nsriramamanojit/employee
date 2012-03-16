Employee::Application.routes.draw do
  resources :users
  resources :user_sessions
  resources :homes

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "user_sessions#new"


  # root :to => "welcome#index"
  # match ':controller(/:action(/:id(.:format)))'
end
