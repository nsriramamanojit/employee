Employee::Application.routes.draw do
  resources :districts

  resources :states

  resources :roles

  resources :users do
    get :profile, :on=>:member
    get :update_profile,:on=>:member
    put :profile_update,:on=>:member
    get :change_password,:on=>:member
    #put :password_change,:on=>:member
  end

  resources :user_sessions
  resources :homes

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "user_sessions#new"


  # root :to => "welcome#index"
  match ':controller(/:action(/:id(.:format)))'
end
